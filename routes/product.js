const { db, } = require('../pgp');

const Product = require('../models/products');
const Category = require('../models/category');
const Image = require('../models/images');

const product = new Product(db);
const cate = new Category(db);
const image = new Image(db);

let log = console.log;

module.exports = function (express) {
    const router = express.Router();

    router.get('/', (req, res) => {
        let q = req.query.page;
        let n = 9;
        let pgfrom = 0;
        if (q != undefined && q > 0) {
            pgfrom = (pgfrom + q - 1) * n;
        } else {
            q = 0;
        }
        //
        let price = req.query.gia;
        let order = req.query.order;
        //
        db.task(t => {
            if (price !== undefined) {
                switch (price) {
                    case 'den5':
                        return t.batch([
                            product.selectByPrice(0, 5000000, n, pgfrom),
                            product.countAllByPrice(0, 5000000),
                            q
                        ])
                        break;
                    case '5den10':
                        return t.batch([
                            product.selectByPrice(5000000, 10000000, n, pgfrom),
                            product.countAllByPrice(5000000, 10000000),
                            q
                        ])
                        break;
                    case '10den15':
                        return t.batch([
                            product.selectByPrice(10000000, 15000000, n, pgfrom),
                            product.countAllByPrice(10000000, 15000000),
                            q
                        ])
                        break;
                    case 'tren15':
                        return t.batch([
                            product.selectByPrice(15000000, 50000000, n, pgfrom),
                            product.countAllByPrice(15000000, 50000000),
                            q
                        ])
                }
            } else if (order !== undefined) {
                switch (order) {
                    case 'newest':
                        return t.batch([
                            product.selectByNewest(n, pgfrom),
                            product.countAll(),
                            q
                        ])
                        break;
                    case 'hotest':
                        return t.batch([
                            product.selectBySales(n, pgfrom),
                            product.countAll(),
                            q
                        ])
                        break;
                    case 'hightolow':
                        return t.batch([
                            product.selectByPriceDesc(n, pgfrom),
                            product.countAll(),
                            q
                        ])
                        break;
                    case 'lowtohigh':
                        return t.batch([
                            product.selectByPriceAsc(n, pgfrom),
                            product.countAll(),
                            q
                        ])
                }
            } else {
                return t.batch([
                    product.selectByPagination(n, pgfrom),
                    product.countAll(),
                    q
                ]);
            }

        })
            .then(data => {
                let countAll = page = 0;
                data[1].forEach((index) => {
                    countAll = index.count;
                    page = Math.ceil(index.count / n, 0);
                });
                if (q > page) {
                    q = 1;
                }
                res.render('danh-sach.html', {
                    pageTitle: 'Điện thoại',
                    products: data[0],
                    countAll: data[1],
                    allpage: page,
                    pageCurrent: q
                });
            })
            .catch(error => {
                res.json({
                    success: false,
                    error: error.message || error
                });
            });
    });

    router.get('/:id', function (req, res) {
        let id = req.params.id;
        db.task(t => {
            return t.batch([
                product.detail(id),
                image.selectByParentId(id),
                product.selectNew(10)
            ]);
        })
            .then(data => {
                res.render('chi-tiet.html', { pageTitle: 'Điện Thoại', detail: data[0], images: data[1], productSimilar: data[2] });
            })
            .catch(error => {
                res.json({
                    success: false,
                    error: error.message || error
                });
            });
    });

    return router
};