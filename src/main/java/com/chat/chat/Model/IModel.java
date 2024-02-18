package com.chat.chat.Model;

import java.util.List;

    public interface IModel <U,L>{
        public U save(U p);
        public U delete(U p);
        public U update(U p);
        public List<U> Findall();
        public U find(L a);

    }
