PGDMP         .    	            u         	   dienthoai    9.6.2    9.6.2 *    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    24577 	   dienthoai    DATABASE     y   CREATE DATABASE dienthoai WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE dienthoai;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12390    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    35150    carts    TABLE     m   CREATE TABLE carts (
    id integer NOT NULL,
    session_user_id text,
    product_id text,
    qty text
);
    DROP TABLE public.carts;
       public         postgres    false    3            �            1259    35148    carts_id_seq    SEQUENCE     n   CREATE SEQUENCE carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.carts_id_seq;
       public       postgres    false    3    194            �           0    0    carts_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE carts_id_seq OWNED BY carts.id;
            public       postgres    false    193            �            1259    35030    detailed_orders    TABLE     �   CREATE TABLE detailed_orders (
    detailed_orders_id text NOT NULL,
    orders_id text,
    product_id text,
    quantity integer,
    price integer
);
 #   DROP TABLE public.detailed_orders;
       public         postgres    false    3            �            1259    24750    field    TABLE     �   CREATE TABLE field (
    field_id text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    description text,
    validation text,
    required boolean,
    field_section_id text
);
    DROP TABLE public.field;
       public         postgres    false    3            �            1259    24737    field_section    TABLE     �   CREATE TABLE field_section (
    field_section_id text NOT NULL,
    name text NOT NULL,
    product_template_id text NOT NULL
);
 !   DROP TABLE public.field_section;
       public         postgres    false    3            �            1259    34849    images    TABLE     ]   CREATE TABLE images (
    image_id text NOT NULL,
    url_image text,
    product_id text
);
    DROP TABLE public.images;
       public         postgres    false    3            �            1259    35022    orders    TABLE     �   CREATE TABLE orders (
    orders_id text NOT NULL,
    user_id text,
    name text,
    phone text,
    email text,
    address text,
    note text,
    status text,
    total integer,
    method text,
    order_date text,
    delivery_date text
);
    DROP TABLE public.orders;
       public         postgres    false    3            �            1259    34979    product    TABLE     S  CREATE TABLE product (
    product_id text NOT NULL,
    product_name text,
    product_template_id text,
    product_type_id text,
    manufacturer_id text,
    sales_volume integer,
    store_day text,
    price integer,
    quantity integer,
    description json,
    main_property json,
    detail_property json,
    promotion text
);
    DROP TABLE public.product;
       public         postgres    false    3            �            1259    24721    product_template    TABLE     a   CREATE TABLE product_template (
    product_template_id text NOT NULL,
    name text NOT NULL
);
 $   DROP TABLE public.product_template;
       public         postgres    false    3            �            1259    34862    product_type    TABLE     a   CREATE TABLE product_type (
    product_type_id text NOT NULL,
    name text,
    parent text
);
     DROP TABLE public.product_type;
       public         postgres    false    3            �           2604    35153    carts id    DEFAULT     V   ALTER TABLE ONLY carts ALTER COLUMN id SET DEFAULT nextval('carts_id_seq'::regclass);
 7   ALTER TABLE public.carts ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    194    194            �          0    35150    carts 
   TABLE DATA               >   COPY carts (id, session_user_id, product_id, qty) FROM stdin;
    public       postgres    false    194   <.       �           0    0    carts_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('carts_id_seq', 149, true);
            public       postgres    false    193            �          0    35030    detailed_orders 
   TABLE DATA               ^   COPY detailed_orders (detailed_orders_id, orders_id, product_id, quantity, price) FROM stdin;
    public       postgres    false    192   �.       �          0    24750    field 
   TABLE DATA               c   COPY field (field_id, name, type, description, validation, required, field_section_id) FROM stdin;
    public       postgres    false    187   �.       �          0    24737    field_section 
   TABLE DATA               M   COPY field_section (field_section_id, name, product_template_id) FROM stdin;
    public       postgres    false    186   �5       �          0    34849    images 
   TABLE DATA               :   COPY images (image_id, url_image, product_id) FROM stdin;
    public       postgres    false    188   Y7       �          0    35022    orders 
   TABLE DATA               �   COPY orders (orders_id, user_id, name, phone, email, address, note, status, total, method, order_date, delivery_date) FROM stdin;
    public       postgres    false    191   �>       �          0    34979    product 
   TABLE DATA               �   COPY product (product_id, product_name, product_template_id, product_type_id, manufacturer_id, sales_volume, store_day, price, quantity, description, main_property, detail_property, promotion) FROM stdin;
    public       postgres    false    190   �>       �          0    24721    product_template 
   TABLE DATA               >   COPY product_template (product_template_id, name) FROM stdin;
    public       postgres    false    185   �_       �          0    34862    product_type 
   TABLE DATA               >   COPY product_type (product_type_id, name, parent) FROM stdin;
    public       postgres    false    189   s`                  2606    35158    carts carts_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
       public         postgres    false    194    194                       2606    35037 $   detailed_orders detailed_orders_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY detailed_orders
    ADD CONSTRAINT detailed_orders_pkey PRIMARY KEY (detailed_orders_id);
 N   ALTER TABLE ONLY public.detailed_orders DROP CONSTRAINT detailed_orders_pkey;
       public         postgres    false    192    192                       2606    24757    field field_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY field
    ADD CONSTRAINT field_pkey PRIMARY KEY (field_id);
 :   ALTER TABLE ONLY public.field DROP CONSTRAINT field_pkey;
       public         postgres    false    187    187            �           2606    24744     field_section field_section_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY field_section
    ADD CONSTRAINT field_section_pkey PRIMARY KEY (field_section_id);
 J   ALTER TABLE ONLY public.field_section DROP CONSTRAINT field_section_pkey;
       public         postgres    false    186    186                       2606    35108    images images_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (image_id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public         postgres    false    188    188            	           2606    35029    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orders_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         postgres    false    191    191                       2606    34986    product product_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public         postgres    false    190    190            �           2606    24728 &   product_template product_template_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY product_template
    ADD CONSTRAINT product_template_pkey PRIMARY KEY (product_template_id);
 P   ALTER TABLE ONLY public.product_template DROP CONSTRAINT product_template_pkey;
       public         postgres    false    185    185                       2606    34869    product_type product_type_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (product_type_id);
 H   ALTER TABLE ONLY public.product_type DROP CONSTRAINT product_type_pkey;
       public         postgres    false    189    189                       2606    35038 "   detailed_orders detailed_orders_id    FK CONSTRAINT     }   ALTER TABLE ONLY detailed_orders
    ADD CONSTRAINT detailed_orders_id FOREIGN KEY (orders_id) REFERENCES orders(orders_id);
 L   ALTER TABLE ONLY public.detailed_orders DROP CONSTRAINT detailed_orders_id;
       public       postgres    false    191    2057    192                       2606    24758 !   field field_field_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY field
    ADD CONSTRAINT field_field_section_id_fkey FOREIGN KEY (field_section_id) REFERENCES field_section(field_section_id) MATCH FULL;
 K   ALTER TABLE ONLY public.field DROP CONSTRAINT field_field_section_id_fkey;
       public       postgres    false    186    187    2047                       2606    24745 4   field_section field_section_product_template_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY field_section
    ADD CONSTRAINT field_section_product_template_id_fkey FOREIGN KEY (product_template_id) REFERENCES product_template(product_template_id) MATCH FULL;
 ^   ALTER TABLE ONLY public.field_section DROP CONSTRAINT field_section_product_template_id_fkey;
       public       postgres    false    186    185    2045                       2606    35109    images product_images_id    FK CONSTRAINT     v   ALTER TABLE ONLY images
    ADD CONSTRAINT product_images_id FOREIGN KEY (product_id) REFERENCES product(product_id);
 B   ALTER TABLE ONLY public.images DROP CONSTRAINT product_images_id;
       public       postgres    false    188    2055    190            �   E   x�34��,�J��w+p��,2L�1M*sL�4�24�@��L�/wN�4ʘ��8'��r�s��qqq �S�      �      x������ � �      �   +  x����O�F���_1�D��?w�� �PJ�9�b�fm�ڻa�(QQTEm�PUU� ��OE���������7c/;�1�%"~��<~߳������SԢQ��FOi�D�O��|7Ǆ��,�k��b����l����눶�,9d�$�ct��%CY͒/1m�'@y`)���X��W��!RR5����(LX�?]�}_�m�y����p��Ӣ�ە9�<`�kd3�nv=�ӑ�:���� �m?zc����A6��+"��R&;���1�ᧇ`q���{��LZd#��� ��1F�����.���4V#�n�
�m|\'sh<�?i�ӽ�%Әd��CD;Y2荶�����uS�s�gY2��V7=$��0�����i�5����*?6����@~n�����c��u͸ۍ}YXÊ�xi�o/�cH�O��}��Г�:����4v���4�J�|3�@�2Bkÿ��rS�O�bځ�z:����'�Oc��xٓ	�l@9?��� rXr/c,r��B�"A�@�M�j�&6$%�ɖvi�%'�\�tl��a��'�@V$_<��.�e�!K~@�ס$�4r���X:y���s)3��6)�����W���z��b+������|	Nk����&���!����ڝL�'I��e�'QQQt'�?�e=1O����5E���l�
L�^X]�ĶV�om�B�n.ݒ�F!}<`���|vK�P��_��[̗��s�y/��NN76��?�ʒדU��j�
�ۿ��Z��D��e�^60��k��Z���c�I���� :��+����B�ukr��B7�P�:���:��y����&�G�8z��s�i�!!Wi� �oCَA�5�n�D9��0(��Lp%��6�U����ne�{�G�7�	V���Un������݅���B}�h�Z��%۴�s���O�Y�Q��XV����w�	1���/��m�q6:�����V��JR�b.�"G��.E$�n'X�S����t]-�U�r�M��!ƒ�þ8˛L��q��IV|���lkʰU~K��E�t�E��ȴm�U��2_#k�0$�����P���=	�@>~c~x�s�-��LB}�^l���:N���>5��'�F�36Qҡ2�Kb)qj�)��6w`�� v� v1�_b�߀u�#��٪�-ߖ�|�ǅ+ma\���t҃�����C�, xǐE��;��k �6D�-�=���G���5&ǡ�
{"���$v4���n���F�<䰒����wL�1KUNp̒JۇK���Z�-�c����a2f���;Z*8YgZ�1hZ�1�Q,u���2�E�p[wr�Y�
@�4�KT��p�{����,9U��S��r�L�$�|
E���ʻ�D�5�в�l*�G�|��l�,].Ľ�b;l����xz���*K�8�5*k�˝Rrv*c�`7{��ì��偂-��`�'��*�`ם�՗K�5�ٔ9-M��k�+�S��S�)�©zQ.�ռ;�� afUAN���QF9<��&�ڦ����ȗn�9�Z�����
D�h����L�rK��*3vy+U05��{��(9P�ޡ8и◀q��IfLX�������� �)	�)C8w�l54�"��c��{*h���;z��I�Ź�dU�������MN�\��Г�W���B�A���<	�C��(�+wCg�j�"��92��Tl49m�BT�5����
�KcY���B�y��1k�l�~s;G��\r�U-6G��^���A�o?�w)�U
�B�1���"-������ԝ<�w����J�v�aOfl����/������T��      �   `  x��P�K�@�/�7u�G��i�Z(����%�����&�ҡ�`q�v,� ��!����'~w外���{�{���qM�u�	/?���i״Yۏ{�?�XUci�^��5�D���b�q$����&��ڗWZQg'�x�4�X/2r�\v.��P�H���H�7tӜG#�­���6IX~�F}:pE����<�6B(g�^�2�'�g��|$Ж���C�����I
^t���{��VSMJ�!���ZA�S�P�ǐr_��ĵm�gj'����I��`S�0���>�GL��9��k�i�MR��T�͝�����:����	Z�+g�$��*��}����0� G�6      �   W  x�e�[��:�����38 ��f͝,˒93L	!�kh�B̯?�!�o��I�%Y��.��7�3�_��M�?��_B�� �w��AP���9|ڐ� �^W��Q�RrT���#h\�ҧ���dUv+��^x)�~���feSML�ڱ��e�A�XD��$���f��	XO�ʴ���`l/�ʂ|;��եkk"�Ж��~I�捲��P-�D��)���@MQ�_���߳k�,�r��9��VB�<�"~�r�~+�~�o�n���_(ɮ�<�<@M�l~��ʂ�'M��ĩgkrT�C�̷Hψ�#���a-C�͇̳!���ͣ�@���\�l�  ��0D^�Q�|r0$�7��J$K?���e`�F�v�D0��:AC��@�
1vF�	�k C��trH�'C�s���&�ɧ��$������� 2��Ɛ�8oy,s�@�3�k\� ����RBp��}@0���2$��}�V` A�X��ݥD�&�nu��ʂ\Q2+����Q�@�i�jN�*/�����"�-��)��5�}�6kA�4��o��@�B��](@��Gٗ[����r)o����E�S�e7Om�<a$�6��-��l�w�,!�-����%h�eca��6r��|ٷm�{��Y	��#����%�,���s�蛛�����晁|bBvP���Ґ����b�4��H[lr��
�U�e~����u�.�e�5P�$v�q�B�ggZO�@/@��T����6�E�S���1c��8hCy��[�e�x�\�||�}�T��@�L0�,��|�;��ZPA��λ�jk"��q*ú�u�����dp���m�e��,�R;O���j��b6='[���`���f������X�G�!d�j�� �D]���&�ZzfC��=�O9g�APDf��v����PT�:����5��>�0$��4��m�A.�"�'q<�䓋w'�� JC��b=�æI����]n]�@Cd> s3�|5�"��߇�yK��4�Ok��]ۜ��HL�@͡�`M��9�X�� *f���lMm�8�d����'�&Cpyp��d.B�<�<�\�����!��
��kY���l��b]	*X�c����`H�|u��CP$>����d�����P>lsΓ9�g��7��Zxw�|s����ͱek-����~�i@3S�8��h���,ߜ��W󜁚�A���-yXy�&���9�ǽm�YY��͉�0�,dK�9?���eY�Qǲ�uw�!ʮ�ِ�` �	��I�(夠!A���W��`A"��u�в|�9\j�;��r~9X���H���W3��\Q�����j��a�����(����hW�T�e�i>�+{fjA.�(�$+XC����p��E"�����GP����'r(��FPq��ͱ0�r�eċ/y�U� ��⯌SjAC">NEq���YD�	�e������ �����C�(Ր���O�g���bs�J�Ԉ�!A_�7$�=Z���S������fy�`,���G�6��1J6'��X��YP�f�{�.����ID�5D�l:`ѣ&k���Φ[Y�� �YB��E(�r�"�x�!_�*�k-�����3�ꇁ����2�fy�ˁ}�t'�e��qXx�kTCA{u�#T&�����G�Er���'t�Y�҇|�AS<���qQ��-�7�O�Z�����"�T��PA�d�YFդE�iţ���2�]c�f�D�!�!2>fҽԂ��yv(���@.�"�}��{Ԑ���e���jl%�t�'p-C>��8��������[�gX}��]E��2/�m9���.��4D��?///�1��      �      x������ � �      �      x��]ko�֙����HeD�y�O�%��زUK���@AK��$*e[]H�]E[l�vQE�LE6�ͦmZ�)��S���K�}�!%R)�jgV������Ṽ�y�;�I>˟�6R�fM'F�j6t� �Z�������U���^�8>���.�*���APe�Ã��ܹ{��$��Ǎ*)U{��O���Q�|u�X�}� �ޓ.�bU{O�8)�={Rr_(jiT����fts��X�X���ԍ��k�&��X-��C�ݳ�Q������g_Yv���!|�vw���\�{�wR�y���Z��[��"��zw�a��z_B�xem��[zOJ���������H���5�$�{҄j��w�F�+xl^�����+x��f=�/�{�Y���ngl�M;��CҀ���=�5	*�ہ7��F�����Z��$�ο���Ȧx�<��3xM�	CC�F�D�*NC�5r�A���F�gq��t����W������9<#�n�� (e��A�s��uL	���(�ߴ����(�{r87�-�܁�Iku���t���I*WE��إ���Ī��?5�u�ʑq�����kmڇ���/H��y��4�H���c�U��ZG�L��篤�%)!����]�-���C����%����`z�R�����	*�<��D�1����;�Xy�X�k8����}6hy����J�j��3�1V|f�D�8�m�b�����`N�;Z-v�5�QR5�vӴ6��eD��j�ry�<_����O�⤳�;�aF�Uf���H��;?�h]�fԡ��;PL�Ϡ�M���
����E	C��{���*N6X��j�8�j���m>�F����������J��_24�^�jhO9�?���%Xڑz�w".�uBo�{�^V���ǇHD���$�ĉd�+�S���*6���?u�~M��/Q:��w¼zv��_���?{\��<�S�����g��Qs�����̿����`T�o6bm��7*VUo�eR�i�v��5�lV�F��,6/�0zurw��P1C�f���|]ǻ<w30GK�5�"��9Lg��Y�~t���ŉ<%�{˵�Ėa�ӏ<4b���+?2p+i���c\�h��GX��J��4T����a�T�<	|�l}��(=���%�����t��i��[�	�y�׳/�D��CF��f�y�����M�m$��竰��pϨ��#<��Р����;'v.��b��hٷO(mv�φ�N�F�n����i��6�~{㥝�����U�Ƌn
����6R�O���')��ָ�~p��$�gt)vaXQ����d�������?#�k�+"J���:=!{ń�q$�6nX�JK�M���
DG�"	�����8��� "�>9�#�
��#��C�DI"/*͛鐐D_6	��b�%{��G�Ba��^ϧ`�'��h�.�-d�
�9v~�_�	\�4�e1�\?,��Цcvyv��a�#�9��r0��ộ��>V����O����N��"��6��;$���Xk[>��(a�l���b�!��3�ƕ1h��	1���Ai7A C�r�Dc;��^m���2����^�?����d[q��;Kp"HӠ�GZI'e��KlB0ȕQ�M��a!�$���r�K�%[D��ȑ��I63�H�1[D�Kc��lut�8��<PTJY3���u�~��i6͖EC����0|=}����`�h�u���5ۺ]ɵaUI��.���3�}v�h�u8.9/r�&�]����ـ=�cv��|l���>%��f˼`�0xiK/w��-j�:Qcu��Q�1j5v�2��j�tW�8Cd��uؑ��f=J���������V��5y���4�<尨5X�p� �q՗ A���\���e4�j JOp���=� ���GL�'.�Q~��E�w�Q�b�ƭӮ��<�
9$���v8$��ҵ2̘+C��ٵ���m����d<���j����Ln��0�2��Ry�[�vC.Z��Ë��ݦQ�j��G0��V�e4,X5-�m������Z�e�݄IJ�ǤީY��5�Q��W��Y�j-�����h�O�;����^���|:��q=6��[�K#֔��`�->$���5AlN�τ��������D*w��6���������V� ͞"��88�֮�beض��/
������>�o�]x�#�e�d�x��;��u�#��V��FC�Q�*�\�= � �fX�"lg�٬$eN�� u��B�3'�t8R,�w#.a7��fh�.I�+�j�k,�ic�.��C�s�,Þ��ACs�t��kx@1בV'X������v'��{U��>�{��[@琶�jW:�5��������C�
�!�������R:I�@\�\�T�u�|5��(����3��`WP�A8�m(�@�M�)e�:Oa����7Q�q��-*`Dua��Qb�kfh����ء�+�󦳙S��m
��+ �H�B���ml�/��ڔ'����a �?T�W7���ݘ��/�=��)G��|����!u�0?�(*�?�'%��P���^Q�'���O�'Pe�I�!�LwkQ���r2S� �<ʀ�o^�:�x�@IR�p73��� ��QxY �~p�׊��( `��[ P�~�N���"���N ��%��}�K�C���$�Y>��V슫l�zmO�i7]RP�,���ڇ��]��L�/&ט�^0�"A ���Y^��S�I�Z���*f������R7�z���tf��jR&�%K�{���T�G�n�8<���A�k�$�n�x�a�]��s�{"��[�Re �&���<�]D�l`{����T��2�2��]���F�s�X���/Hg�������"J��u>�bؔ���w�Ǫ2�Q��oX��Op\$uV��cvI�9h��Qi�%������("X���)��m����~A��+�'"	Va
*�2��M=�&|��I�r�OQ���(u���W��0���-�d-�Ld0�� Bչ�h������鶞J�_�~t�J���:��:�l�$c�=�w
�����wO5R�~�.�ɻ�?��"��:�F�3eX�������d1�tKG��Wk��f���c���<������	�\���$�;qy./mg�����+#��������0Y���r2.��ˈT�4&'f��;{D8�,ȶ`}����e&af&q)df��i��8��-�V��"e"���B���H*w�<M8�>�	u]��$�;�4x ���[��6E���ԵK��^����C!��qv���7E�Ŀ!��;G$���Q�d{�=�#��w����@���NE��(���tK��o^��(Ò<���ܞ�mؾ��l�ɂ<uH,�S�U��|1���|HH�҄����j���P�j[�`l`2�G�!K�����,�}�l�-T	X3
�[�5²T�$n��:����TRL_�=�D��7��`f��L��%\ #�4mOFTْ�:R"󻧥@�YoJ0޹S�����w��X�4�Ů�s�P�Y_�Hk�uXZ;�
��A�M���F<��4+@s�nñ���7��i?�l&ӆ�m�ҵK��W6t�^��z�nX1�`��Ş[��o9[|;��ۧ�̢���bJS�1c^S�H�Xbk�*��l��%m�A�o�@��T�O5����ʢS?kR��b9�k�Z -<Ё	�t�u��y�3��Aȳ��Ǉ��U��Q0]rL����7������$�;/ٺ^^3-_נx�~�����f�`�yK/ ��X�>{.r�\����	��4�@xd�A0�ce����L�Z@��Z��%�%V�����a̍F��������J�˓��8�|Ⓒ�òi�8�c���1CK���l��{�����⫒6]�]$����1/P��ġ#5���j>����}�F۹� u�y$�Z�X���������k��[����7H �JǛn��\ё���7�����'�������k�    n8Q��x������;e-�[����(/$�����rD��,}H�.��d~e���I�=���\�rSQ<�?|=�t\�Q�m��Iw���Kt u����%<��ē/���\s
Ƅ�JP>��J֨Tc'z۬u�[J����/pÞ��NF�Nq��G�|kH>+J�����|�9��Ĥ�$�2GMbɾ׫��`*�T���6�y�0Ueo ����*L~��M?T�x��J8\����
VI�Q6�5#�$W�P�;�8�(�E�N� d�o���~�0�_0)��ꀇ�/�h��Iаcq�l7��(�|�S	��sh���5Ԉ����B��l����A����)*K�?g;Q����~��ُ���#8��soD�I�X<ğs���
�g3$�.[Sa��&i� ������;6tD���$��S�<�l!y� _�:��n������Nn9RrE���bK�����g	nr��r��Ŕ�h���@�Bb�>��Әb�F�}hn��ӻ��E���7�F�9<����GfN�3A��;��XCe��k��Ba�5��Z��4��+�9�*����y��!:?�c\���5�Z:����T����*�,>��K6�˽O��Ʋo(.xb���Xb=�����a���te��4�#qȶ�8�?�P\��
J�s������!r1^�=� �����e���͞����I�N�I;��HNk��u�V3��fg��M㫼��!�uz1;��@��,jJ�h�H�ᬎFl���㸞9m��a3�E���q�yeV[��l�w��!��58�Ù�<݆�^�B�+�Β�X�>���"Y����	!�F�v)�I0��QYN���%vO��L�is=G�Nx�2e��,��|�N�,��m��C%u��eJ��V	�:��}� ���ˆf�$WT�y��)h�o��8�]��P�F�lY�M,%��XI��X)��A`tgG�=*J0Q���f{0���T6ٰ�lc���c`�m�9�dX�7�V&�#8q���5$?�!KA�f>a�n��|;�~�_p2�tw�k�Z�1� ���Ґ�Ea��q���>��a�q��oӊpG���d�;��4��xn��@s\|�>Y��~洩���Õ-��T�tw�K�OE�'��#��}bY��Z�z���U��:U�ݼ8,y0Xr�F�k�5�^��5�^��5�^��5�^����n+R���X1l�A{�<u2#':�ߕ1 93�o*�2�u����nu0��ӫL2v�U6��49n�$�,�8\ܐǧ/�l$.q��z�i~<�.)��^3Lr�sn'ą!�
���'<L �a�̏���y�xȸ�.=޴AG�Hg�a�o�16��E�#�`���KȮ�ϥy������{���{"Iq�3%�g ,��8l�֑�R�/�y��!8���s@�,���0`M�d������RKׁ�J��̚I=�'Ӛ)IHX϶�\��}gY�� X>u����9X|	LB��S4��d��+9ΓȡY�M��5�"Z8A.܁/��\l.3���u/�`S���ax�U�c(�ŗvU��6�P/��J��z-YJ�]��a��$�X�����Т5{m�1�m�$q2M��2y�����z#N:>�"e��.�������zE	�C��q2n_g��˳���E9.˧��/���o�"����^y<ϐ�T������$'���b�M�l�2$R�=�|�[�K�st�a�L���{� �V8��~�)\bTU���y�qA���Yj�bF`E�}�	��΀����0=u�p��S%��h	��{�>0��7^��u�r���6�u���B�p��m0�]F����� 5���y�6���5A��	"2��Z��:�F���N)��FY6q|L��e�26l_�5����A�"�����ʪX+�߯q(Pz�d��Y1��S�n'�Y���B��gJ��b܆U������^m��2:��s�d�0��3b�;�%�e�$!*�3d|Tϒ�3 _	K�Gy(,ٽqX\8o��m�\�}�a��,�O��,�M�2	�!-TK�sHݝ�JW�AS2Չ$��De�NDut"������(e���X��dGr�>q�@"r\��;��3�{Pgx��D�����49g��!b�낢��Yb�}����r$n��E�� ��@�}h��5k�hF"
���O��F�����Q��J��σ�H>#On�@�O!?� h\�~."q\J"L�I�@g�_��5�q%% ;Q��K��!Z^|�郝0�����-Sw"x�b���B���[��9S�!q�٩��N��>�7��KC�D��"��#zoCID�.�x��z�����@�sB �C�7!'�y!.Q�"��wN�R����f�#М�"�:�4�_G���Řj�@Ʈu<�zra7ƙ/Ͼ�b�7X��n�2��B�ʄ=r�<L@ڏ9DB�BG;����a��V��;7��M6�36Q�AS0tϻ7;��Q��ِ(�#����W�R卮>v�i����u2�Ս�N�'?yk�ڻ� ��>F&�drnWLYZk�l��ݛn�lUMr���L�o	�>��l��LD��K߯ՌXQUQ���⽕����(�18x�"`�v�c�<�i�Χ�<�wo�&�~��b��@��ND>��o:�A!��}��T$�z���pZ��H`�P�?���D����'V�C8c�r�ʶi�@NB6�@̄ǀ�k��$iIq�n9��d���A!W���H���s�\�-��3�f?.�=��ǆ���jװ���d��o��*����.0MT�|������YPƙ�6}����@#R�`.�M˛�¹Jk�&L�v�a�Y���<d��V~�2�p�K��p�F��i�ҵO�	U}�l-��	�fe* �b}QY�G�ʯ�/�'�Pl�'������e�1�Yu*���}-\�<*�]���(�ApO ��\�m�'[jA]��k�r�R�Y�5K��XJ�0�y�5O��)�<嚧\�/4O���*�y��xM&��Q�T*�@M�J�%������;�J���������ctNw��2�Nf]4|��]���#�2��e�XaWpT�X�9�����$�"�L$�{�8;"kǞxK,,,�8\�?,��b� \x3�9�^��_��L���b�0�S�tC��.�2s�O�7�+�f��JU)ԡ$!��&�-��_��R8H�=�s�屩�;���Hp���]���� ߌ��&|}w��� <g;�J��F�{��Ũb�w�M��"]��}w׾��3�]Y	�P��~I�O|wK;��8/��n�o=��l��@�&`l$�4Ü<��C� otƥN�<,tJA��w����z���Q�v�]�������2z�@Ƒ��ĤWIn���Ű$xy��^���]�?$�����f!i����d7FD"3e����$d����4[w��D�Io�t��=�Gg�����8��JH��y����,	i��j��͕(֓����]�5���N���8,A�^����N&��Ũ�\�n:=��=Kb
Gv�K#{�ʤn6����%����Z���2Z$�i��/�ѝڇw"���ۉ���1W(ۼl�!��IU6��M���$�n�d�%��L�MbLp��$أƯG��3Y�f��<���9ؚ I���=��$��$WaH ���x��K�$MrĐAvT�h0(S|#�Hɠ0w�sc��3y��R��T5<�X��|��̄���"���tB./R�-.%7}��C�咥�|�2�ئ���|��<��i�5Zx�� o&����$��2���E�fY�������P���vSQO�)!���A�k�i���[�������	<�r^`g��%���\��G���Y���dJ���2�j�h�jVkZ�Sˮ���j�R����ǾJZU��6����ERg�-<f�����e	QJ���[Q"D�8�T��ʶ��r^��f0�5���H���E؃�J��`L_$   �A[��x�)*����y�s�Bh��~��@3! �6���Y�t�ꅷQL�Ho
ߘ���·���v��ذj�;ޡC�M��篱�޳��'c�5�nLҾ��������+#�M��[F�5��N��_�x�-_l��I%�����-�$�"T�j8��*�")���4�r��[: ���]���]�^<�1�?Yv���7E�¿!��;G$���Q�d{�=�#��w���b8@��NE��d� �饗�N~�      �   k   x��50��M,*Q(���K��50��,�2�9C�^���p�¼ ߄����J��̇��� ���~wO�TH>�0W���̇����f�G& ٍ�
�7%r��qqq ��'�      �   �   x�M���0D��)� ����")i�8��D�%;ЦO��)P�eP��&ؐHWܻ��os�ne�7�N�0���8SA&��c��~L*ȢR�����`1�fŬ1B+��hS�,�'1�"]JNAN%*.�՚�)j��Y8��qE��v����R	��G?��D�����[��<(�;<P�l9}�B>q�e�     