PGDMP     #    4                z            online_retail    13.3    13.0 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    57510    online_retail    DATABASE     q   CREATE DATABASE online_retail WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE online_retail;
                postgres    false            �            1259    82148    bankdetails    TABLE     u   CREATE TABLE public.bankdetails (
    id integer NOT NULL,
    bankname text,
    accountnumber character varying
);
    DROP TABLE public.bankdetails;
       public         heap    postgres    false            �            1259    82146    bankdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bankdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.bankdetails_id_seq;
       public          postgres    false    209            �           0    0    bankdetails_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.bankdetails_id_seq OWNED BY public.bankdetails.id;
          public          postgres    false    208            �            1259    82129 	   customers    TABLE        CREATE TABLE public.customers (
    id integer NOT NULL,
    firstname character varying(100),
    secondname character varying,
    mobilenumber numeric,
    address text,
    password character varying(100),
    bankdetaisid integer,
    email "char"
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    82127    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    205            �           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    204            �            1259    82110 	   inventory    TABLE     �   CREATE TABLE public.inventory (
    id integer NOT NULL,
    name character varying(100),
    bp integer,
    sp integer,
    quantity integer,
    category character varying(100),
    sale integer
);
    DROP TABLE public.inventory;
       public         heap    postgres    false            �            1259    82108    inventory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.inventory_id_seq;
       public          postgres    false    201            �           0    0    inventory_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.id;
          public          postgres    false    200            �            1259    82140    orderdetails    TABLE     �   CREATE TABLE public.orderdetails (
    id integer NOT NULL,
    inventoryid integer,
    ordersid integer,
    quantity integer
);
     DROP TABLE public.orderdetails;
       public         heap    postgres    false            �            1259    82138    orderdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orderdetails_id_seq;
       public          postgres    false    207            �           0    0    orderdetails_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orderdetails_id_seq OWNED BY public.orderdetails.id;
          public          postgres    false    206            �            1259    82118    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer,
    total integer,
    discount integer,
    order_date text
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    82116    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    203            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    202            A           2604    82151    bankdetails id    DEFAULT     p   ALTER TABLE ONLY public.bankdetails ALTER COLUMN id SET DEFAULT nextval('public.bankdetails_id_seq'::regclass);
 =   ALTER TABLE public.bankdetails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            ?           2604    82132    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            =           2604    82113    inventory id    DEFAULT     l   ALTER TABLE ONLY public.inventory ALTER COLUMN id SET DEFAULT nextval('public.inventory_id_seq'::regclass);
 ;   ALTER TABLE public.inventory ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            @           2604    82143    orderdetails id    DEFAULT     r   ALTER TABLE ONLY public.orderdetails ALTER COLUMN id SET DEFAULT nextval('public.orderdetails_id_seq'::regclass);
 >   ALTER TABLE public.orderdetails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            >           2604    82121 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �          0    82148    bankdetails 
   TABLE DATA           B   COPY public.bankdetails (id, bankname, accountnumber) FROM stdin;
    public          postgres    false    209   �3       �          0    82129 	   customers 
   TABLE DATA           t   COPY public.customers (id, firstname, secondname, mobilenumber, address, password, bankdetaisid, email) FROM stdin;
    public          postgres    false    205   �5       �          0    82110 	   inventory 
   TABLE DATA           O   COPY public.inventory (id, name, bp, sp, quantity, category, sale) FROM stdin;
    public          postgres    false    201   �:       �          0    82140    orderdetails 
   TABLE DATA           K   COPY public.orderdetails (id, inventoryid, ordersid, quantity) FROM stdin;
    public          postgres    false    207   �>       �          0    82118    orders 
   TABLE DATA           N   COPY public.orders (id, customer_id, total, discount, order_date) FROM stdin;
    public          postgres    false    203   �?       �           0    0    bankdetails_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.bankdetails_id_seq', 40, true);
          public          postgres    false    208            �           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 40, true);
          public          postgres    false    204            �           0    0    inventory_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.inventory_id_seq', 40, true);
          public          postgres    false    200            �           0    0    orderdetails_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orderdetails_id_seq', 42, true);
          public          postgres    false    206            �           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 40, true);
          public          postgres    false    202            O           2606    82156    bankdetails bankdetails_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.bankdetails
    ADD CONSTRAINT bankdetails_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.bankdetails DROP CONSTRAINT bankdetails_pkey;
       public            postgres    false    209            H           2606    82137    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    205            C           2606    82115    inventory inventory_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_pkey;
       public            postgres    false    201            M           2606    82145    orderdetails orderdetails_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_pkey;
       public            postgres    false    207            F           2606    82126    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    203            I           1259    82162    fki_bankdidcustomers    INDEX     R   CREATE INDEX fki_bankdidcustomers ON public.customers USING btree (bankdetaisid);
 (   DROP INDEX public.fki_bankdidcustomers;
       public            postgres    false    205            J           1259    82168    fki_detailsorders    INDEX     N   CREATE INDEX fki_detailsorders ON public.orderdetails USING btree (ordersid);
 %   DROP INDEX public.fki_detailsorders;
       public            postgres    false    207            K           1259    82174    fki_invdetails    INDEX     N   CREATE INDEX fki_invdetails ON public.orderdetails USING btree (inventoryid);
 "   DROP INDEX public.fki_invdetails;
       public            postgres    false    207            D           1259    82180    fki_ordercustomer    INDEX     K   CREATE INDEX fki_ordercustomer ON public.orders USING btree (customer_id);
 %   DROP INDEX public.fki_ordercustomer;
       public            postgres    false    203            Q           2606    82157    customers bankdidcustomers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT bankdidcustomers FOREIGN KEY (bankdetaisid) REFERENCES public.bankdetails(id) NOT VALID;
 D   ALTER TABLE ONLY public.customers DROP CONSTRAINT bankdidcustomers;
       public          postgres    false    205    209    2895            R           2606    82163    orderdetails detailsorders    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT detailsorders FOREIGN KEY (ordersid) REFERENCES public.orders(id) NOT VALID;
 D   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT detailsorders;
       public          postgres    false    207    2886    203            S           2606    82169    orderdetails invdetails    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT invdetails FOREIGN KEY (inventoryid) REFERENCES public.inventory(id) NOT VALID;
 A   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT invdetails;
       public          postgres    false    207    2883    201            P           2606    82175    orders ordercustomer    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT ordercustomer FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;
 >   ALTER TABLE ONLY public.orders DROP CONSTRAINT ordercustomer;
       public          postgres    false    2888    205    203            �   7  x��TYn�@���K��Nޥ?�# %��.����I꺆l"�|���:ݽ����<�h�Yh�� ����P$�ti��v�O��tߌF���Pe����u>mw��˗�eE�:�Qm:6���Lʒn7S��y�9���e��=�빹�<���Ua=��t|j"e�>\�ˤ�UJ\�c�
�^mz�O�aZ��ϧyۚH��h�2�t�H�b�@Y̝赿�
�Fx~N��{��N�Si"���nKɄ��d�������z۾-��CC?+���V(i�h�6�24��o+Y��FJv*6o����
����N���"RH�u�w�/�����S��H��r��lSÜ��4��r�z8S��ݏ�o0�p�G�R����w�d��Ȥ�1
|����j�4 ��2T��AT�}�Q��5��m>A� �ydG�ʸ*��%�/FȻ�&��5	�#�?�b�p�dՂm]��Q;�"�2̾�����1%����fm'���^d���I�b�@l�%����VR�.y�_��h -����YR�$�S]�?V"���+���O�����`A      �     x�%�Is*9���dN3�����0���g�\�q/�f�_?);� � ��>e�8���<�NkߐU"W6Z����d��p|�%	IU&h���4�]��#��Z�kb���̼_���4$53I�*įU�O�@3�i)��;�厘����>��#)h����u���x\�o��Q\(�!M��@����� �0���}}
�˪�|�&#�PXn9���]�>-��׎��.��\���w��un�%�R�1�Yn���ݤ?ꥮ��Г���N��- 韟F}Fwˇ��G�N�B��E���N��Bm�rH�Lic��}��;��P��͏��Q)�QV��r*����D������W�]��4�]�r�3Ԉ�a�G��6�t.��0Is��mHkG���I0
4(|�R�ߣ>)��N��$��}>֚M���8B�����n4�&w@��(��v��;����s�1�`�nq�_�fD�$��8N�󳺘v��+}����}A�cRɚ
�%��x�i���D�\Cu,i~�e� ����i��t�/���:��kH9�M��9s�hƄ!C_A|��'��V���[�\'8B�e��e;���q�1M����NO��v��2���4�׹� ��nS��'�Ye�9�]BM��*Oډ�m9�=�����<���E&8��,���b���/�5B��RoZ���v��e=���"��ѵt��Vr��p\?<��xC��G�o�ĀB�\r�$��I�p�.��?���ak����9(�N�>7��a#�3��o2��.\J��հ�R�H �j�$��l;��֙�4�gn�jO�3JH�CpK*⽳=�����.�	�>6!����֑59����8y���!��l	/t�J�3��9m��⦸�p���i�#zl����V���?���^	&l3t}�����s(��U�pǧ4|lF�yi^T*���^�UI�S��9�YΘ�m$���j6�WQ���&!��pG%�@o}�� �Ęb�@T=�u?W��|����/)�2�#�Us~���2���c������d	+Gש{܃>�*z<U%,؋m�Ls<	��7�&�6$i�)<�uL�����Z�ΝvVa�jFW;-��/895g 1.i�U��FZ\�J7�};
�C��0s�66�fF1��<`蜥G�c������n�ϒ���]���Oզ�Fx0PLH�s#�O/�s�{J�#g4)�_"�B�^�c�Ҫ�dSV���痭�4Ď�ɲ�H���      �     x��UKS�H>��
�Rpٚ�y�����BŻ����
!Q������FȘ�u%������%E���c&V�Rp�R��V��g�?T���{��z��@��`:kv�u�{$K�V���Ά��Ԍ�M�Q��r��t�u��ݤ�q���KSݦ��ݏܗB6^�P���^��A��QdC�ty�\Q4ZXZ�]�I3-Y]��)Cߤ67Cu���8%�p4���p��(r�.���z��*��jY��:kR������4�X��`�`~U�X�ؔ��b@�=�\>u�/ղ�iI@'�+:*M��#�4�I�V��.����R(9�ʒ#��>�/]wW�<��?%g�P�>�J[@�\�tѿ�,`���ݮ��'ן�OII��j�)#1�CY�ǘfL�=@�l���n�|���Ƽ��ꩮ�ދ�vOE[��޼"�#�0�9�O��T�M.��HW�e��@=�V���7�'��Ӑ�E-p�|��[4V�^)iZ��F�[w-1��LTCVJ��(�w����U���4�x���^�e c<�����׳�r`�فr��u��O���a����h�{�\��ba=O=:��]�Ὰj��@�N@�{`��/!YAG���=�0N[���0������s�}�x�����M�h�a�~7�W-����m!�|ǺA�9�g��i�!�6��wز�}�Q�b*�8��,w}[�	e���Gl�-Ppe�)=�C��}H�"H��$���"pu���V�g�\��F���6�+��떫'���}�zƌI����2��a���L�Rh570��E��ƙ,�d�yr��jMT�gX�>�Mu��Q�B��|�E|nNS��gJj�!Q�t�b\p�I� R۷`4�|DX[��Wf�@hw �GI�G���\���H ��$"^�/@�nK�d�)0�CyQe�_�'V���N�_j[X@���vܬJN^>��|��6m3y`fH"6������b�%��!��a�      �   �   x�5���0C�r1;�mb+���X	��^@F2�������[81:<���X��X�Uώ�:.F�q`�1G,9�Cq���eqP���'��,?�g-z�U�T{�"�n��$W�2o@���2��3-��YM9���^+,C�[��<�	W�2e��|(����~9]k����j����*]���&���Y�}Zk��K      �   �  x�MS��H{��lq�l�q�p�{�g[$!���Z���c���QV�(Y�Np�����"Fħ��<�D��s� 	-
f�8R_(HQR�$��B�����jzi�a�j�%�x��B!���*��sG)���;y�R�/$L*4��*>�?�h���F�V�H^PI��K���M/G|���<�1��M`I�KO�f�G���W4�!p9�Ώ���1$A� �y��ֱ�hPT̛��{L1��r|dK���,�]@b���~�v�(VHCM'ɾ��a�;���[���'x�p-����'%�V>�:x��FURdM�G�n�:ĄRL@A�mUǭB�t� ߨ��5k�r�o�t��@&0��БM��Y�I��o�����Q����GP.�$�QhP�yvs��|�*�p�4~��'(]�������� ��Cp�@��2������l��|��&����xl~;��=P���Ž
z��h��s�-�K*ʁWp�z�+p�+
��������x��     