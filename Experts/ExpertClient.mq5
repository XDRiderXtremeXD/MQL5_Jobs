/ / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |                                                                                       C o p y   T r a d e r   C l i e n t . m q 4   |  
 / / |                                                                                                                                     |  
 / / |                                                                                                                                     |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 # p r o p e r t y   c o p y r i g h t   " "  
 # p r o p e r t y   l i n k             " "  
 # p r o p e r t y   v e r s i o n       " 3 . 2 0 "  
 # p r o p e r t y   s t r i c t  
  
 # i m p o r t   " C o p y T r a d e r . d l l "  
 v o i d   S e t N a m e ( s t r i n g   m e s s a g e ) ;  
 b o o l   R e c e i v e ( s t r i n g   & m e s s a g e , s t r i n g   a d d r e s s ) ;  
 # i m p o r t  
  
 # d e f i n e   O P _ B U Y     0  
 # d e f i n e   O P _ S E L L   1  
 # d e f i n e   O P _ B U Y L I M I T   2  
 # d e f i n e   O P _ S E L L L I M I T   3  
 # d e f i n e   O P _ B U Y S T O P   4  
 # d e f i n e   O P _ S E L L S T O P   5  
  
  
 e n u m   r i s k _ t y p e  
     {  
       R i s k E q u i t y = 0 ,               / / R i s k   f r o m   E q u i t y  
       R i s k A c c B a l = 1 ,               / / R i s k   f r o m   A c c o u n t   B a l a n c e  
     } ;  
  
 e n u m   A l l o w e d T y p e s  
     {  
       A l l ,  
       B u y 1 , / / B u y  
       S e l l 1 , / / S e l l  
       N o n e  
     } ;  
  
 e n u m   D D M O D E  
     {  
       I m m e d i a t e ,  
       B r e a k e v e n  
     } ;  
  
 # i n c l u d e < T r a d e \ T r a d e . m q h >  
 C T r a d e   t r a d e ;  
  
  
 s t r i n g   s y m b o l s [ 2 8 ] =   {   " E U R U S D " , " G B P U S D " , " A U D U S D " , " U S D J P Y " , " U S D C H F " , " U S D C A D " , " E U R A U D " , " E U R C A D " , " E U R C H F " , " E U R G B P " , " E U R J P Y " , " G B P J P Y " , " G B P C H F " , " N Z D U S D " , " A U D C A D " , " A U D J P Y " , " C H F J P Y " , " A U D N Z D " , " N Z D J P Y " , " N Z D C A D " , " N Z D C H F " , " G B P N Z D " , " E U R N Z D " , " G B P C A D " , " G B P A U D " , " A U D C H F " , " C A D C H F " , " C A D J P Y "   } ;  
 d a t e t i m e   l a s t C a n d l e P a i r [ 2 8 ] =   { 0 } ;  
  
  
 i n p u t   s t r i n g   h i n t 1 = " - - - - - - - - - - - - -   G l o b a l   S e t t i n g s   - - - - - - - - - - - - - " ; / / = = = = = = = = = = = = = = = = = = = = = = = = = =  
 i n p u t   s t r i n g   S e r v e r N a m e = " S L A V E " ; / / S e r v e r   N a m e  
 i n p u t   s t r i n g   I d e n t i f i e r = " - a " ;  
 d o u b l e   L o t = 0 . 0 1 ;  
 i n p u t   b o o l   M a s t e r T r a d e C l o s e = t r u e ; / / M a s t e r   T r a d e   C l o s e  
 i n p u t   i n t   L a t e n c y = 3 0 ;  
 i n p u t   d o u b l e   S p r e a d M u l t i p l i e r = 1 ; / / S p r e a d   M u l t i p l i e r  
 i n p u t   b o o l   S a m e C a n d l e C h e c k = t r u e ;  
  
  
 i n p u t   s t r i n g   h i n t 5 = " - - - - - - - - - - - - -   R i s k   S e t t i n g s   - - - - - - - - - - - - - " ; / / = = = = = = = = = = = = = = = = = = = = = = = = = =  
 i n p u t   r i s k _ t y p e   R i s k F r o m   =   R i s k A c c B a l ; / / R i s k   F r o m  
 i n p u t   d o u b l e   R i s k P e r c e n t 1   =   0 . 7 5 ; / / R i s k   %   f r o m   B a l a n c e / E q u i t y  
 d o u b l e   R i s k P e r c e n t   = R i s k P e r c e n t 1 ;  
 b o o l   I n c r e a s e R i s k O n L o s s   =   f a l s e ; / / I n c r e a s e   R i s k   a f t e r   S t o p L o s s  
 d o u b l e   R i s k I n c r e a s e M u l t i p l i e r   =   1 . 2 5 ; / / R i s k   I n c r e a s e   F a c t o r  
 i n p u t   b o o l   R o u n d U p C a l c u l a t e d L o t T o A c c o u n t M i n L o t   =   t r u e ; / /   T a k e   M i n i m u m   L o t s   w h e n   B a l a n c e   i s   L o w  
 i n p u t   b o o l   E n a b l e F u n d e d A c c o u n t   =   f a l s e ; / / E n a b l e   f u n d e d   a c c o u n t   r i s k   c a l c  
 i n p u t   i n t   F u n d e d A c c o u n t B a l a n c e   =   2 5 0 ; / / F u n d e d   a c c o u n t   b a l a n c e   t o   u s e  
  
 i n p u t   s t r i n g   h i n t 4 = " - - - - - - - - - - - - -   E q u i t y   E x i t   L e v e l s   - - - - - - - - - - - - - " ; / / = = = = = = = = = = = = = = = = = = = = = = = = = =  
 i n p u t   b o o l   E n a b l e E q u i t y E x i t   =   f a l s e ; / / E n a b l e   E q u i t y   E x i t  
 i n p u t   d o u b l e   E q u i t y E x i t   =   2 5 ; / / P o s i t i v e   E x i t   %  
 i n p u t   d o u b l e   E q u i t y E x i t N e g   =   - 8 0 ; / / N e g a t i v e   E x i t   %  
 i n p u t   d o u b l e   E q u i t y S t o p T r a d i n g   =   0 . 5 ; / / S t o p   N e w   T r a d e   w h e n   E q u i t y   i s   l e s s   t h a n   x %   t o   t a r g e t  
 i n p u t   i n t   C y c l e C o u n t = 0 ; / / C y c l e   C o u n t   0   a n d   w i l l   n o t   t a k e   a n y   t r a d e s   f u r t h e r  
  
  
 i n p u t   s t r i n g   h i n t 4 A = " - - - - - - - - - - - - -   P o s i t i v e   E q u i t y   E x i t   T r a i l i n g   - - - - - - - - - - - - - " ; / / = = = = = = = = = = = = = = = = = = = = = = = = = =  
 i n p u t   b o o l   E n a b l e E q u i t y E x i t T r a i l i n g   =   f a l s e ; / / E n a b l e   E q u i t y   E x i t   T r a i l i n g  
 i n p u t   d o u b l e   E q S t a r t L e v e l = 6 ;  
 i n p u t   d o u b l e   T r a i l G a p = 1 ;  
  
 i n p u t   d o u b l e   L e v e l 1 = 3 ;  
 i n p u t   d o u b l e   T r a i l G a p 1 = 3 ;  
  
 i n p u t   d o u b l e   L e v e l 2 = 1 . 5 ;  
 i n p u t   d o u b l e   T r a i l G a p 2 = 1 . 5 ;  
  
 i n p u t   d o u b l e   L e v e l 3 = 1 ;  
 i n p u t   d o u b l e   T r a i l G a p 3 = 1 ;  
  
 i n p u t   s t r i n g   h i n t 4 b = " - - - - - - - - - - - - -   N e g a t i v e   E q u i t y   E x i t   T r a i l i n g   - - - - - - - - - - - - - " ; / / = = = = = = = = = = = = = = = = = = = = = = = = = =  
 i n p u t   b o o l   E n a b l e N e g t i v e E q u i t y E x i t T r a i l i n g   =   f a l s e ; / / E n a b l e   N e g t i v e   E q u i t y   E x i t   T r a i l i n g  
 i n p u t   d o u b l e   E q N e g S t a r t L e v e l = - 1 0 ;  
 i n p u t   d o u b l e   E q N e g S t a r t T r a i l A t = - 5 ;  
 i n p u t   d o u b l e   N e g T r a i l G a p = 1 ;  
 i n p u t   d o u b l e   N e g S t e p = 3 ;  
 i n p u t   b o o l   A l l o w T r a d e A f t e r N e g t i v e = t r u e ;  
  
 i n p u t   s t r i n g   h i n t 4 C = " - - - - - - - - - - - - -   A c c o u n t   B a l a n c e   D D   T r a i l i n g   - - - - - - - - - - - - - " ; / / = = = = = = = = = = = = = = = = = = = = = = = = = =  
  
 i n p u t   b o o l   E n a b l e D D T r i a l i n g   =   f a l s e ; / / E n a b l e   D D   T r a i l i n g  
 i n p u t   d o u b l e   D D N e g S t a r t L e v e l = - 1 0 ;  
 i n p u t   d o u b l e   D D G a p = 2 ;  
 i n p u t   d o u b l e   D D S t e p = 1 ;  
 i n p u t   D D M O D E   D D M o d e = I m m e d i a t e ;  
  
  
 i n p u t   s t r i n g   h i n t 3 = " - - - - - - - - - - - - -   C l o s i n g   T r a d e s   - - - - - - - - - - - - - " ; / / = = = = = = = = = = = = = = = = = = = = = = = = = =  
 i n p u t   b o o l   E n a b l e C A T   =   f a l s e ; / / E n a b l e   C l o s e   A l l   T r a d e s  
 i n p u t   s t r i n g   C l o s i n g _ T i m e   =   " 2 2 : 0 0 : 0 0 " ; / / C l o s i n g   T i m e  
  
 i n p u t   b o o l   E n a b l e M a n u a l E q u i t y E x i t       =   f a l s e ;               / / E n a b l e   M a n u a l   E q u i t y   E x i t  
 i n p u t   d o u b l e   M a n u a l _ E q u i t y E x i t P o s       =   1 0 3 0 ;                 / / M a n u a l   E q u i t y   P o s i t i v e   E x i t   i n   v a l u e  
 i n p u t   d o u b l e   M a n u a l _ E q u i t y E x i t N e g       =   6 0 0 ;                 / / M a n u a l   E q u i t y   N e g a t i v e   E x i t   i n   v a l u e  
  
 i n p u t   s t r i n g   h i n t 2 = " - - - - - - - - - - - - -   F a k e   S L   - - - - - - - - - - - - - " ; / / = = = = = = = = = = = = = = = = = = = = = = = = = =  
 i n p u t   b o o l   F a k e S L = t r u e ; / / F a k e   S L  
 i n p u t   d o u b l e   M u l t i p l i e r = 1 0 ;  
  
 b o o l   o n c e = f a l s e ;  
  
 i n p u t   s t r i n g   P o s t F i x = " " ;  
 i n p u t   b o o l   U s e I n p u t M a g i c N u m b e r = t r u e ;  
 i n p u t   i n t   M a g i c N u m b e r = 1 2 3 ;  
  
 i n p u t   b o o l   E n a b l e _ C o p y _ M a g i c = t r u e ;  
 i n p u t   b o o l   E n a b l e _ C o p y _ C o m m e n t = t r u e ;  
 i n p u t   b o o l   E n a b l e _ R i s k _ P e r _ C o m m e n t = t r u e ;  
 i n p u t   s t r i n g   M a g i c _ N u m b e r s _ t o _ C o p y = " 1 2 , 3 4 , 5 6 , 7 8 , 9 0 " ; / / M a g i c   N u m b e r s   t o   C o p y  
 i n p u t   s t r i n g   T r a d e _ C o m m e n t s _ t o _ C o p y = " A A A , B B B , C C C , D D D , E E E " ; / / T r a d e   C o m m e n t s   t o   C o p y  
 i n p u t   s t r i n g   R i s k _ P e r c e n t a g e _ f o r _ T r a d e _ C o m m e n t s = " 2 , 1 . 5 , 1 . 2 5 , 1 , 0 . 7 5 " ; / / R i s k   P e r c e n t a g e   f o r   T r a d e   C o m m e n t s  
  
 i n p u t   s t r i n g   h i n t 1 5 7 = " - - - - - - - - - - - - -   P a i r   S e l e c t i o n   - - - - - - - - - - - - - " ; / / = = = = = = = = = = = = = = = = = = = = = = = = = =  
  
 i n p u t   b o o l   E n a b l e P a i r S e l e c t i o n = f a l s e ;  
 i n p u t   A l l o w e d T y p e s   A U D C A D _ A l l o w = N o n e ; / / A U D C A D  
 i n p u t   A l l o w e d T y p e s   A U D C H F _ A l l o w = N o n e ; / / A U D C H F  
 i n p u t   A l l o w e d T y p e s   A U D J P Y _ A l l o w = N o n e ; / / A U D J P Y  
 i n p u t   A l l o w e d T y p e s   A U D N Z D _ A l l o w = N o n e ; / / A U D N Z D  
 i n p u t   A l l o w e d T y p e s   A U D U S D _ A l l o w = N o n e ; / / A U D U S D  
 i n p u t   A l l o w e d T y p e s   C A D C H F _ A l l o w = N o n e ; / / C A D C H F  
 i n p u t   A l l o w e d T y p e s   C A D J P Y _ A l l o w = N o n e ; / / C A D J P Y  
 i n p u t   A l l o w e d T y p e s   C H F J P Y _ A l l o w = N o n e ; / / C H F J P Y  
 i n p u t   A l l o w e d T y p e s   E U R A U D _ A l l o w = N o n e ; / / E U R A U D  
 i n p u t   A l l o w e d T y p e s   E U R C A D _ A l l o w = N o n e ; / / E U R C A D  
 i n p u t   A l l o w e d T y p e s   E U R C H F _ A l l o w = N o n e ; / / E U R C H F  
 i n p u t   A l l o w e d T y p e s   E U R G B P _ A l l o w = N o n e ; / / E U R G B P  
 i n p u t   A l l o w e d T y p e s   E U R J P Y _ A l l o w = N o n e ; / / E U R J P Y  
 i n p u t   A l l o w e d T y p e s   E U R N Z D _ A l l o w = N o n e ; / / E U R N Z D  
 i n p u t   A l l o w e d T y p e s   E U R U S D _ A l l o w = N o n e ; / / E U R U S D  
 i n p u t   A l l o w e d T y p e s   G B P A U D _ A l l o w = N o n e ; / / G B P A U D  
 i n p u t   A l l o w e d T y p e s   G B P C A D _ A l l o w = N o n e ; / / G B P C A D  
 i n p u t   A l l o w e d T y p e s   G B P C H F _ A l l o w = N o n e ; / / G B P C H F  
 i n p u t   A l l o w e d T y p e s   G B P J P Y _ A l l o w = N o n e ; / / G B P J P Y  
 i n p u t   A l l o w e d T y p e s   G B P N Z D _ A l l o w = N o n e ; / / G B P N Z D  
 i n p u t   A l l o w e d T y p e s   G B P U S D _ A l l o w = N o n e ; / / G B P U S D  
 i n p u t   A l l o w e d T y p e s   N Z D C A D _ A l l o w = N o n e ; / / N Z D C A D  
 i n p u t   A l l o w e d T y p e s   N Z D C H F _ A l l o w = N o n e ; / / N Z D C H F  
 i n p u t   A l l o w e d T y p e s   N Z D J P Y _ A l l o w = N o n e ; / / N Z D J P Y  
 i n p u t   A l l o w e d T y p e s   N Z D U S D _ A l l o w = N o n e ; / / N Z D U S D  
 i n p u t   A l l o w e d T y p e s   U S D C A D _ A l l o w = N o n e ; / / U S D C A D  
 i n p u t   A l l o w e d T y p e s   U S D C H F _ A l l o w = N o n e ; / / U S D C H F  
 i n p u t   A l l o w e d T y p e s   U S D J P Y _ A l l o w = N o n e ; / / U S D J P Y  
  
  
  
  
 b o o l   E n a b l e L o g = t r u e ;  
  
 i n t   c u r _ d i g i t s ;  
 s t r i n g   s y m ;  
  
  
 b o o l   t a r g e t H i t = f a l s e ;  
 b o o l   t a r g e t H i t m = f a l s e ;  
 d o u b l e   s t a r t B a l a n c e = 0 ;  
  
 d a t e t i m e   d t 8 ;  
 i n t   c n t = 0 ;  
 b o o l   c l = f a l s e ;  
  
 s t r u c t   c m n t  
     {  
       s t r i n g                         c m n t ;  
       d o u b l e                         p r ;  
     } ;  
  
 c m n t   C o m m e n t L i s t [ ] ;  
  
 s t r i n g   M a g i c L i s t [ ] ;  
  
  
 d o u b l e   C u r r e n t L e v e l = 0 ;  
 d o u b l e   H i g h L e v e l = 0 ;  
 i n t   C u r r e n t L e v e l 1 = 0 ;  
 s t r i n g   l b l = " S H E A . " ,   g b l ;  
  
 b o o l   N e g t i v e H i t = f a l s e ;  
 d o u b l e   C u r r e n t L e v e l N e g = 1 0 0 ;  
 i n t   C u r r e n t L e v e l 1 N e g = 1 0 0 ;  
 b o o l   T r a i l U n L o c k e d = f a l s e ;  
 b o o l   T r a i l A l l o w e d = f a l s e ;  
 b o o l   D D N e g H i t = f a l s e ;  
 d o u b l e   D D S t o p L e v e l = 0 ;  
 d o u b l e   T r a i l L e v e l = 0 ;  
 b o o l   D D N e g H i t C o m p l e t e d = f a l s e ;  
 b o o l   B E H i t = f a l s e ;  
 d o u b l e   s t a r t B a l a n c e D D = 0 ;  
 d o u b l e   t a r g e t H i t D D = f a l s e ;  
  
 d a t e t i m e   T i m e U n t i l = D ' 2 0 2 3 . 0 9 . 1 7   0 0 : 0 0 ' ;  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |   E x p e r t   i n i t i a l i z a t i o n   f u n c t i o n                                                                       |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 i n t   O n I n i t ( )  
     {  
  
       i f ( T i m e C u r r e n t ( ) > = T i m e U n t i l )  
           {  
             A l e r t ( " T i m e   T e s t   e n d e d   o n   " , T i m e T o S t r i n g ( T i m e U n t i l , T I M E _ D A T E | T I M E _ M I N U T E S ) ) ;  
             r e t u r n   I N I T _ F A I L E D ;  
           }  
  
       A l e r t ( " T e s t   t i m e   u n t i l   " , T i m e T o S t r i n g ( T i m e U n t i l , T I M E _ D A T E | T I M E _ M I N U T E S ) ) ;  
  
       A r r a y I n i t i a l i z e ( l a s t C a n d l e P a i r ,   0 ) ;  
       S e t N a m e ( S e r v e r N a m e ) ;  
  
       P r i n t ( " C l i e n t   s t a r t e d   w i t h   s e r v e r   p a t h   " + S e r v e r N a m e ) ;  
  
       A r r a y R e s i z e ( C o m m e n t L i s t , 0 ) ;  
       A r r a y R e s i z e ( M a g i c L i s t , 0 ) ;  
  
       s t r i n g   t o _ s p l i t = T r a d e _ C o m m e n t s _ t o _ C o p y ;  
       s t r i n g   s e p = " , " ;  
       u s h o r t   u _ s e p ;  
       u _ s e p = S t r i n g G e t C h a r a c t e r ( s e p , 0 ) ;  
  
       s t r i n g   r e s u l t [ ] ;  
       s t r i n g   r e s u l t 1 [ ] ;  
       s t r i n g   r e s u l t 2 [ ] ;  
 / /   s t r i n g   r e s u l t 3 [ ] ;  
 / /   s t r i n g   r e s u l t 4 [ ] ;  
 / /   s t r i n g   r e s u l t 5 [ ] ;  
 / /   s t r i n g   r e s u l t 6 [ ] ;  
  
  
       t o _ s p l i t = R i s k _ P e r c e n t a g e _ f o r _ T r a d e _ C o m m e n t s ;  
       S t r i n g S p l i t ( t o _ s p l i t , u _ s e p , r e s u l t 1 ) ;  
  
       t o _ s p l i t = T r a d e _ C o m m e n t s _ t o _ C o p y ;  
       i n t   k = S t r i n g S p l i t ( t o _ s p l i t , u _ s e p , r e s u l t ) ;  
       i f ( k > 0 )  
           {  
             f o r ( i n t   i = 0 ;   i < k ;   i + + )  
                 {  
                   i n t   s i z e =   A r r a y S i z e ( C o m m e n t L i s t ) ;  
                   A r r a y R e s i z e ( C o m m e n t L i s t , s i z e + 1 ) ;  
                   C o m m e n t L i s t [ s i z e ] . c m n t = r e s u l t [ i ] ;  
                   C o m m e n t L i s t [ s i z e ] . p r = S t r i n g T o D o u b l e ( r e s u l t 1 [ i ] ) ;  
                 }  
           }  
  
       t o _ s p l i t = M a g i c _ N u m b e r s _ t o _ C o p y ;  
       k = S t r i n g S p l i t ( t o _ s p l i t , u _ s e p , r e s u l t 2 ) ;  
       i f ( k > 0 )  
           {  
             f o r ( i n t   i = 0 ;   i < k ;   i + + )  
                 {  
                   i n t   s i z e =   A r r a y S i z e ( M a g i c L i s t ) ;  
                   A r r a y R e s i z e ( M a g i c L i s t , s i z e + 1 ) ;  
                   M a g i c L i s t [ s i z e ] = r e s u l t 2 [ i ] ;  
                 }  
           }  
  
  
       g b l = l b l + I n t e g e r T o S t r i n g ( M a g i c N u m b e r ) + " . " ;  
       i f ( M Q L I n f o I n t e g e r ( M Q L _ T E S T E R ) )  
           {  
             g b l = " B . " + g b l ;  
             G l o b a l V a r i a b l e s D e l e t e A l l ( g b l ) ;  
           }  
  
       t a r g e t H i t = f a l s e ;  
       t a r g e t H i t m = f a l s e ;  
        
       t r a d e . S e t E x p e r t M a g i c N u m b e r ( M a g i c N u m b e r ) ;  
  
       r e t u r n ( I N I T _ S U C C E E D E D ) ;  
     }  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |   E x p e r t   d e i n i t i a l i z a t i o n   f u n c t i o n                                                                   |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 v o i d   O n D e i n i t ( c o n s t   i n t   r e a s o n )  
     {  
  
     }  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |   E x p e r t   t i c k   f u n c t i o n                                                                                           |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 v o i d   O n T i c k ( )  
     {  
       i f ( T i m e U n t i l < = T i m e C u r r e n t ( ) )  
           {  
             A l e r t ( " T i m e   T e s t   e n d e d   o n   " , T i m e T o S t r i n g ( T i m e U n t i l , T I M E _ D A T E | T I M E _ M I N U T E S ) ) ;  
             E x p e r t R e m o v e ( ) ;  
           }  
  
       M q l D a t e T i m e   s t r 1 ;  
       T i m e T o S t r u c t ( T i m e C u r r e n t ( ) , s t r 1 ) ;  
       M q l R a t e s   r a t e s [ ] ;  
       A r r a y S e t A s S e r i e s ( r a t e s , t r u e ) ;  
       i n t   c o p i e d = C o p y R a t e s ( N U L L , 0 , 0 , 5 , r a t e s ) ;  
       i f ( c o p i e d < = 0 )  
             P r i n t ( " F a l l o   a l   c o p i a r   l o s   d a t o s   d e   p r e c i o s   " , G e t L a s t E r r o r ( ) ) ;  
  
       d a t e t i m e   C l o s i n g T i m e = ( s t r i n g ) s t r 1 . y e a r + " . " + ( s t r i n g ) s t r 1 . m o n + " . " + ( s t r i n g ) s t r 1 . d a y + "   " + C l o s i n g _ T i m e ;  
  
  
       i f ( d t 8 ! = i T i m e ( S y m b o l ( ) , P E R I O D _ D 1 , 0 ) )  
           {  
             C u r r e n t L e v e l 1 N e g = 1 0 0 ;  
             T r a i l U n L o c k e d = f a l s e ;  
             T r a i l A l l o w e d = f a l s e ;  
             N e g t i v e H i t = f a l s e ;  
             c l = f a l s e ;  
             t a r g e t H i t = f a l s e ;  
             c n t = 0 ;  
             s t a r t B a l a n c e = 0 ;  
             C u r r e n t L e v e l = 0 ;  
             C u r r e n t L e v e l 1 = 0 ;  
             d t 8 = i T i m e ( S y m b o l ( ) , P E R I O D _ D 1 , 0 ) ;  
  
             D D S t o p L e v e l = 0 ;  
             t a r g e t H i t D D = f a l s e ;  
             D D N e g H i t = f a l s e ;  
             D D N e g H i t C o m p l e t e d = f a l s e ;  
             B E H i t = f a l s e ;  
           }  
  
  
       i f ( t a r g e t H i t )  
           {  
             P r i n t L o g ( " T r a d e   s k i p p e d   d u t e   t o   e q u i t y   e x i t " ) ;  
           }  
  
       i f ( c l )  
           {  
             P r i n t L o g ( " T r a d e   s k i p p e d   d u t e   t o   c l o s i n g   t i m e " ) ;  
           }  
  
  
       i f ( E n a b l e C A T )  
           {  
             i f ( r a t e s [ 0 ] . t i m e > = C l o s i n g T i m e )  
                 {  
                   i f ( I s A n y O r d e r A c t i v e ( - 1 ) ! = - 1 )  
                       {  
                         C l o s e A l l O r d e r s ( - 1 ) ;  
                         P r i n t ( " A l l   P o s i t i o n   c l o s e d   d u e   t o   C l o s i n g   T i m e   o n   " + T i m e T o S t r i n g ( C l o s i n g T i m e ) ) ;  
                         c l = t r u e ;  
                       }  
                   r e t u r n ;  
                 }  
           }  
  
  
       i f ( E n a b l e M a n u a l E q u i t y E x i t )  
           {  
             i f ( t a r g e t H i t m )  
                   r e t u r n ;  
             i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = M a n u a l _ E q u i t y E x i t P o s )  
                 {  
                   i f ( I s A n y O r d e r A c t i v e ( - 1 ) ! = - 1 )  
                       {  
                         C l o s e A l l O r d e r s ( - 1 ) ;  
                         P r i n t ( " a l l   o r d e r s   a r e   c l o s e d   o n   M a n u a l _ E q u i t y E x i t P o s   h i t " ) ;  
                         t a r g e t H i t m = t r u e ;  
                       }  
  
                 }  
             i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) < = M a n u a l _ E q u i t y E x i t N e g )  
                 {  
                   i f ( I s A n y O r d e r A c t i v e ( - 1 ) ! = - 1 )  
                       {  
                         C l o s e A l l O r d e r s ( - 1 ) ;  
                         P r i n t ( " a l l   o r d e r s   a r e   c l o s e d   o n   M a n u a l _ E q u i t y E x i t N e g   h i t " ) ;  
                         t a r g e t H i t m = t r u e ;  
                       }  
                 }  
           }  
  
       s t r i n g   C o m m e n t 1 = " " ;  
       d o u b l e   t a r g e t = 0 ;  
  
  
       i f ( E n a b l e D D T r i a l i n g )  
           {  
             i f ( D D N e g H i t C o m p l e t e d )  
                 {  
                   P r i n t ( " N o   t r a d e   d u e   t o   d d   h i t " ) ;  
                   r e t u r n ;  
                 }  
  
             i f ( s t a r t B a l a n c e D D = = 0 )  
                 {  
                   s t a r t B a l a n c e D D = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
                   / / i f   ( E n a b l e F u n d e d A c c o u n t   & &   s t a r t B a l a n c e > F u n d e d A c c o u n t B a l a n c e )   s t a r t B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
                   d o u b l e   f u n d e d B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
                   i f ( f u n d e d B a l a n c e > A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) )  
                         f u n d e d B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
                   P r i n t ( " d d   s t a r t   b a l a n c e   u p d a t e d   ( " + S y m b o l ( ) + " )   :   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e D D , 2 ) + "   o n   " + T i m e T o S t r i n g ( r a t e s [ 0 ] . t i m e ) ) ;  
                   P r i n t ( " d d   s t a r t   l e v e l   i s   " + D o u b l e T o S t r i n g ( D D N e g S t a r t L e v e l ,   2 ) + " % ,   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e D D + D D N e g S t a r t L e v e l * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e D D ) : s t a r t B a l a n c e D D ) / 1 0 0 ,   2 ) + " $ " ) ;  
  
                   t a r g e t H i t D D = f a l s e ;  
                 }  
  
  
             d o u b l e   f u n d e d B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
             i f ( f u n d e d B a l a n c e > A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) )  
                   f u n d e d B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
  
             d o u b l e   E q T g t   =   0 ;  
  
             E q T g t = s t a r t B a l a n c e D D + ( ( D D N e g S t a r t L e v e l * s t a r t B a l a n c e D D ) / 1 0 0 ) ;  
  
             i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) < = E q T g t )  
                 {  
                   i f ( D D N e g H i t = = f a l s e )  
                       {  
                         D D N e g H i t = t r u e ;  
                         D D S t o p L e v e l = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) - ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) * D D G a p / 1 0 0 ) ;  
                         T r a i l L e v e l = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) + ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) * D D S t e p / 1 0 0 ) ;  
                       }  
                 }  
  
             i f ( D D N e g H i t )  
                 {  
  
                   i f ( D D M o d e = = I m m e d i a t e )  
                       {  
                         i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = T r a i l L e v e l )  
                             {  
                               D D S t o p L e v e l = T r a i l L e v e l - ( T r a i l L e v e l * D D G a p / 1 0 0 ) ;  
                               T r a i l L e v e l = T r a i l L e v e l + ( T r a i l L e v e l * D D S t e p / 1 0 0 ) ;  
                             }  
  
                         i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) < = D D S t o p L e v e l )  
                             {  
                               D D N e g H i t C o m p l e t e d = t r u e ;  
                               C l o s e A l l O r d e r s ( - 1 ) ;  
                               P r i n t ( " a l l   o r d e r s   a r e   c l o s e d   o n   d d   h i t   l e v e l   " +   D D S t o p L e v e l ) ;  
                             }  
                       }  
                   e l s e  
                       {  
                         i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = s t a r t B a l a n c e D D )  
                             {  
                               i f ( B E H i t = = f a l s e )  
                                   {  
                                     B E H i t = t r u e ;  
                                     D D S t o p L e v e l = s t a r t B a l a n c e D D - ( s t a r t B a l a n c e D D * D D G a p / 1 0 0 ) ;  
                                     T r a i l L e v e l = s t a r t B a l a n c e D D + ( s t a r t B a l a n c e D D * D D S t e p / 1 0 0 ) ;  
                                   }  
                             }  
  
                         i f ( B E H i t )  
                             {  
                               i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = T r a i l L e v e l )  
                                   {  
                                     D D S t o p L e v e l = T r a i l L e v e l - ( T r a i l L e v e l * D D G a p / 1 0 0 ) ;  
                                     T r a i l L e v e l = T r a i l L e v e l + ( T r a i l L e v e l * D D S t e p / 1 0 0 ) ;  
                                   }  
  
                               i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) < = D D S t o p L e v e l )  
                                   {  
                                     D D N e g H i t C o m p l e t e d = t r u e ;  
                                     C l o s e A l l O r d e r s ( - 1 ) ;  
                                     P r i n t ( " a l l   o r d e r s   a r e   c l o s e d   o n   d d   h i t   l e v e l   " +   D D S t o p L e v e l ) ;  
                                   }  
                             }  
                       }  
                 }  
  
  
             C o m m e n t ( " D D   " +   D D N e g H i t + "   " + B E H i t + "   "   +   D o u b l e T o S t r i n g ( T r a i l L e v e l , 2 ) + "   " + D o u b l e T o S t r i n g ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) , 2 ) + "   " + D o u b l e T o S t r i n g ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) , 2 ) + "   " +   D o u b l e T o S t r i n g ( D D S t o p L e v e l , 2 )   + "   " + E q T g t ) ;  
  
  
             i f ( D D N e g H i t C o m p l e t e d )  
                 {  
                   P r i n t ( " N o   t r a d e   d u e   t o   d d   h i t " ) ;  
                   r e t u r n ;  
                 }  
  
           }  
  
  
       i f ( E n a b l e N e g t i v e E q u i t y E x i t T r a i l i n g )  
           {  
  
             i f ( A l l o w T r a d e A f t e r N e g t i v e = = f a l s e )  
                 {  
                   i f ( N e g t i v e H i t )  
                       {  
                         P r i n t ( " N o   t r a d e   d u e   t o   n e g t i v e " ) ;  
                         r e t u r n ;  
                       }  
                 }  
  
  
             i f ( I s A n y O r d e r A c t i v e ( - 1 ) = = - 1 )  
                 {  
                   C u r r e n t L e v e l 1 N e g = 1 0 0 ;  
                   T r a i l U n L o c k e d = f a l s e ;  
                   T r a i l A l l o w e d = f a l s e ;  
                 }  
  
             i f ( s t a r t B a l a n c e = = 0 )  
                 {  
                   s t a r t B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
                   / / i f   ( E n a b l e F u n d e d A c c o u n t   & &   s t a r t B a l a n c e > F u n d e d A c c o u n t B a l a n c e )   s t a r t B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
                   d o u b l e   f u n d e d B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
                   i f ( f u n d e d B a l a n c e > A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) )  
                         f u n d e d B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
                   P r i n t ( " s t a r t   b a l a n c e   u p d a t e d   ( " + S y m b o l ( ) + " )   :   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e , 2 ) + "   o n   " + T i m e T o S t r i n g ( r a t e s [ 0 ] . t i m e ) ) ;  
                   P r i n t ( " n e g t i v e   s t a r t   l e v e l   i s   " + D o u b l e T o S t r i n g ( E q N e g S t a r t L e v e l ,   2 ) + " % ,   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e + E q N e g S t a r t L e v e l * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ,   2 ) + " $ " ) ;  
                   P r i n t ( " l o s s   t a r g e t   i s   " + D o u b l e T o S t r i n g ( E q u i t y E x i t N e g ,   2 ) + " % ,   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e + E q u i t y E x i t N e g * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ,   2 ) + " $ " ) ;  
  
                   t a r g e t H i t = f a l s e ;  
                 }  
  
             d o u b l e   f u n d e d B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
             i f ( f u n d e d B a l a n c e > A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) )  
                   f u n d e d B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
             d o u b l e   E q T g t   =   0 ;  
  
  
             i f ( C u r r e n t L e v e l 1 N e g = = 1 0 0 )  
                 {  
                   E q T g t = ( s t a r t B a l a n c e + E q N e g S t a r t L e v e l * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ) ;  
  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) < = E q T g t )  
                       {  
                         P r i n t ( " R e a c h e d   N e g t i v e   T r i g g e r   " +   E q T g t   + "   " +   A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) ) ;  
                         T r a i l U n L o c k e d = t r u e ;  
                         C u r r e n t L e v e l 1 N e g = 9 9 ;  
                       }  
                 }  
  
             i f ( T r a i l U n L o c k e d   & &   T r a i l A l l o w e d = = f a l s e )  
                 {  
                   E q T g t = ( s t a r t B a l a n c e + ( E q N e g S t a r t L e v e l + E q N e g S t a r t T r a i l A t ) * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ) ;  
  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = E q T g t )  
                       {  
                         T r a i l A l l o w e d = t r u e ;  
                         P r i n t ( " R e a c h e d   N e g t i v e   S t a r t L e v e l   " +   E q T g t ) ;  
                         C u r r e n t L e v e l 1 N e g = ( E q N e g S t a r t L e v e l + E q N e g S t a r t T r a i l A t ) ;  
                       }  
                 }  
  
             i f ( T r a i l A l l o w e d )  
                 {  
  
                   E q T g t = ( s t a r t B a l a n c e + ( C u r r e n t L e v e l 1 N e g + N e g S t e p ) * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ) ;  
  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = E q T g t )  
                       {  
                         d o u b l e   a m =   ( s t a r t B a l a n c e + ( ( C u r r e n t L e v e l 1 N e g + N e g S t e p ) ) * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ) ;  
                         P r i n t ( " T r a i l e d   t o     " + E q T g t + "   " + C u r r e n t L e v e l 1 N e g + "   " +   N e g S t e p + "   " + ( C u r r e n t L e v e l 1 N e g + N e g S t e p ) + " N e w   T a r g e t   " +   ( C u r r e n t L e v e l 1 N e g + N e g T r a i l G a p ) + "   c l   " + a m ) ;  
                         / /   - 5 - 3 = - 4   >   - 5  
                         i f ( C u r r e n t L e v e l 1 N e g + N e g S t e p > C u r r e n t L e v e l 1 N e g )  
                             {  
                               C u r r e n t L e v e l 1 N e g = C u r r e n t L e v e l 1 N e g + N e g S t e p ;  
                             }  
                       }  
  
                   E q T g t = ( s t a r t B a l a n c e + ( C u r r e n t L e v e l 1 N e g - N e g T r a i l G a p ) * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ) ;  
  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) < = E q T g t )  
                       {  
                         i f ( I s A n y O r d e r A c t i v e ( - 1 ) ! = - 1 )  
                             {  
                               N e g t i v e H i t = t r u e ;  
                               C l o s e A l l O r d e r s ( - 1 ) ;  
                               P r i n t ( " a l l   o r d e r s   a r e   c l o s e d   o n   n e g   t r a i l   h i t   l e v e l   " +   C u r r e n t L e v e l 1 N e g   + "   " +   E q T g t ) ;  
  
                               C u r r e n t L e v e l 1 N e g = 1 0 0 ;  
                               T r a i l U n L o c k e d = f a l s e ;  
                               T r a i l A l l o w e d = f a l s e ;  
  
                             }  
                       }  
                 }  
  
             d o u b l e   E q S L     =   ( ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e )   *   ( E q u i t y E x i t N e g / 1 0 0 ) )   +   s t a r t B a l a n c e ;  
             i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) < = E q S L )  
                 {  
  
                   i f ( I s A n y O r d e r A c t i v e ( - 1 ) ! = - 1 )  
                       {  
                         N e g t i v e H i t = t r u e ;  
                         C l o s e A l l O r d e r s ( - 1 ) ;  
                         P r i n t ( " a l l   o r d e r s   a r e   c l o s e d   o n   l o s s   t a r g e t   h i t   n e g t i v e " ) ;  
  
                       }  
                 }  
  
  
             C o m m e n t ( " o k   " + E q T g t + "   " +   A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) ) ;  
  
             i f ( A l l o w T r a d e A f t e r N e g t i v e = = f a l s e )  
                 {  
                   i f ( N e g t i v e H i t )  
                       {  
                         P r i n t ( " N o   t r a d e   d u e   t o   n e g t i v e " ) ;  
                         r e t u r n ;  
                       }  
                 }  
           }  
  
       i f ( E n a b l e E q u i t y E x i t T r a i l i n g )  
           {  
  
             i f ( I s A n y O r d e r A c t i v e ( - 1 ) = = - 1 )  
                 {  
                   C u r r e n t L e v e l 1 = 0 ;  
                 }  
  
             i f ( s t a r t B a l a n c e = = 0 )  
                 {  
                   s t a r t B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
                   / / i f   ( E n a b l e F u n d e d A c c o u n t   & &   s t a r t B a l a n c e > F u n d e d A c c o u n t B a l a n c e )   s t a r t B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
                   d o u b l e   f u n d e d B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
  
                   i f ( f u n d e d B a l a n c e > A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) )  
                         f u n d e d B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
                   P r i n t ( " s t a r t   b a l a n c e   u p d a t e d   ( " + S y m b o l ( ) + " )   :   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e , 2 ) + "   o n   " + T i m e T o S t r i n g ( r a t e s [ 0 ] . t i m e ) ) ;  
                   P r i n t ( " p r o f i t   t a r g e t   i s   " + D o u b l e T o S t r i n g ( E q S t a r t L e v e l ,   2 ) + " % ,   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e + E q S t a r t L e v e l * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ,   2 ) + " $ " ) ;  
                   P r i n t ( " l o s s   t a r g e t   i s   " + D o u b l e T o S t r i n g ( E q u i t y E x i t N e g ,   2 ) + " % ,   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e + E q u i t y E x i t N e g * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ,   2 ) + " $ " ) ;  
  
                   t a r g e t H i t = f a l s e ;  
                 }  
  
  
             i f ( t a r g e t H i t )  
                   r e t u r n ;  
             d o u b l e   f u n d e d B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
             i f ( f u n d e d B a l a n c e > A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) )  
                   f u n d e d B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
             d o u b l e   E q T g t   =   0 ;  
  
             i f ( C u r r e n t L e v e l 1 = = 0 )  
                 {  
  
  
                   E q T g t = ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e )   *   ( E q S t a r t L e v e l / 1 0 0 )   +   s t a r t B a l a n c e ;  
  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = E q T g t )  
                       {  
                         C u r r e n t L e v e l = E q S t a r t L e v e l - T r a i l G a p ;  
                         C u r r e n t L e v e l 1 + + ;  
                       }  
                 }  
  
             i f ( C u r r e n t L e v e l 1 = = 1 )  
                 {  
                   E q T g t   =   ( ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e )   *   ( ( E q S t a r t L e v e l + L e v e l 1 ) / 1 0 0 ) )   +   s t a r t B a l a n c e ;  
  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = E q T g t )  
                       {  
  
                         C u r r e n t L e v e l = E q S t a r t L e v e l + L e v e l 1 - T r a i l G a p 1 ;  
                         C u r r e n t L e v e l 1 + + ;  
                       }  
                 }  
  
             i f ( C u r r e n t L e v e l 1 = = 2 )  
                 {  
                   E q T g t   =   ( ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e )   *   ( ( E q S t a r t L e v e l + L e v e l 1 + L e v e l 2 ) / 1 0 0 ) )   +   s t a r t B a l a n c e ;  
  
  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = E q T g t )  
                       {  
  
                         C u r r e n t L e v e l = E q S t a r t L e v e l + L e v e l 1 + L e v e l 2 - T r a i l G a p 2 ;  
                         C u r r e n t L e v e l 1 + + ;  
                       }  
                 }  
  
             i f ( C u r r e n t L e v e l 1 = = 3 )  
                 {  
                   E q T g t   =   ( ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e )   *   ( ( E q S t a r t L e v e l + L e v e l 1 + L e v e l 2 + L e v e l 3 ) / 1 0 0 ) )   +   s t a r t B a l a n c e ;  
  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = E q T g t )  
                       {  
                         C u r r e n t L e v e l = E q S t a r t L e v e l + L e v e l 1 + L e v e l 2 + L e v e l 3 - T r a i l G a p 3 ;  
                         H i g h L e v e l = C u r r e n t L e v e l ;  
                         C u r r e n t L e v e l 1 + + ;  
                       }  
                 }  
  
             i f ( C u r r e n t L e v e l 1 > 3 )  
                 {  
                   E q T g t   =   ( ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e )   *   ( ( C u r r e n t L e v e l + L e v e l 3 + T r a i l G a p 3 ) / 1 0 0 ) )   +   s t a r t B a l a n c e ;  
  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = E q T g t )  
                       {  
                         i f ( C u r r e n t L e v e l + T r a i l G a p 3 < C u r r e n t L e v e l + L e v e l 3 + T r a i l G a p 3 )  
                             {  
                               C u r r e n t L e v e l = C u r r e n t L e v e l + L e v e l 3 ;  
                               C u r r e n t L e v e l 1 + + ;  
                             }  
                       }  
                 }  
  
             t a r g e t = E q T g t ;  
  
             i f ( C u r r e n t L e v e l ! = 0 )  
                 {  
                   E q T g t   =   ( ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e )   *   ( C u r r e n t L e v e l / 1 0 0 ) )   +   s t a r t B a l a n c e ;  
  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) < E q T g t )  
                       {  
                         i f ( I s A n y O r d e r A c t i v e ( - 1 ) ! = - 1 )  
                             {  
                               C l o s e A l l O r d e r s ( - 1 ) ;  
                               P r i n t ( " a l l   o r d e r s   a r e   c l o s e d   o n   p r o f i t   t a r g e t   h i t   l e v e l   " +   C u r r e n t L e v e l 1 ) ;  
                               c n t + + ;  
                             }  
                         i f ( c n t > = C y c l e C o u n t )  
                             {  
                               t a r g e t H i t = t r u e ;  
                               C u r r e n t L e v e l = 0 ;  
                               C u r r e n t L e v e l 1 = 0 ;  
                             }  
                       }  
                 }  
  
  
             d o u b l e   E q S L     =   ( ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e )   *   ( E q u i t y E x i t N e g / 1 0 0 ) )   +   s t a r t B a l a n c e ;  
             i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) < = E q S L )  
                 {  
                   i f ( I s A n y O r d e r A c t i v e ( - 1 ) ! = - 1 )  
                       {  
                         C l o s e A l l O r d e r s ( - 1 ) ;  
                         P r i n t ( " a l l   o r d e r s   a r e   c l o s e d   o n   l o s s   t a r g e t   h i t   t r a i l " ) ;  
                         c n t + + ;  
                       }  
  
  
                   i f ( c n t > = C y c l e C o u n t )  
                       {  
                         t a r g e t H i t = t r u e ;  
                         C u r r e n t L e v e l = 0 ;  
                         C u r r e n t L e v e l 1 = 0 ;  
                       }  
                 }  
  
             i f ( C u r r e n t L e v e l 1 ! = 0 )  
                 {  
                   C o m m e n t 1 = " C u r r e n t   L e v e l   i s   " +   C u r r e n t L e v e l 1 + "   P r o f i t   T a r g e t   " + t a r g e t + "   C l o s e   P r o f i t   " +   E q T g t   + "   C l o s e   L e v e l   " +   C u r r e n t L e v e l   ;  
                 }  
             e l s e  
                 {  
                   C o m m e n t 1 = " " ;  
                 }  
           }  
       e l s e  
           {  
             i f ( E n a b l e E q u i t y E x i t )  
                 {  
                   i f ( s t a r t B a l a n c e = = 0 )  
                       {  
                         s t a r t B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
                         / / i f   ( E n a b l e F u n d e d A c c o u n t   & &   s t a r t B a l a n c e > F u n d e d A c c o u n t B a l a n c e )   s t a r t B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
                         d o u b l e   f u n d e d B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
                         i f ( f u n d e d B a l a n c e > A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) )  
                               f u n d e d B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
                         P r i n t ( " s t a r t   b a l a n c e   u p d a t e d   ( " + S y m b o l ( ) + " )   :   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e , 2 ) + "   o n   " + T i m e T o S t r i n g ( r a t e s [ 0 ] . t i m e ) ) ;  
                         P r i n t ( " p r o f i t   t a r g e t   i s   " + D o u b l e T o S t r i n g ( E q u i t y E x i t ,   2 ) + " % ,   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e + E q u i t y E x i t * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ,   2 ) + " $ " ) ;  
                         P r i n t ( " l o s s   t a r g e t   i s   " + D o u b l e T o S t r i n g ( E q u i t y E x i t N e g ,   2 ) + " % ,   " + D o u b l e T o S t r i n g ( s t a r t B a l a n c e + E q u i t y E x i t N e g * ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e ) / 1 0 0 ,   2 ) + " $ " ) ;  
                         t a r g e t H i t = f a l s e ;  
                       }  
  
  
                   i f ( t a r g e t H i t )  
                         r e t u r n ;  
                   d o u b l e   f u n d e d B a l a n c e = F u n d e d A c c o u n t B a l a n c e ;  
                   i f ( f u n d e d B a l a n c e > A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) )  
                         f u n d e d B a l a n c e = A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ;  
                   d o u b l e   E q T g t   =   ( ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e )   *   ( E q u i t y E x i t / 1 0 0 ) )   +   s t a r t B a l a n c e ;  
                   d o u b l e   E q S L     =   ( ( E n a b l e F u n d e d A c c o u n t ? M a t h M i n ( f u n d e d B a l a n c e , s t a r t B a l a n c e ) : s t a r t B a l a n c e )   *   ( E q u i t y E x i t N e g / 1 0 0 ) )   +   s t a r t B a l a n c e ;  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) > = E q T g t )  
                       {  
                         i f ( I s A n y O r d e r A c t i v e ( - 1 ) ! = - 1 )  
                             {  
                               C l o s e A l l O r d e r s ( - 1 ) ;  
                               P r i n t ( " a l l   o r d e r s   a r e   c l o s e d   o n   p r o f i t   t a r g e t   h i t " ) ;  
                               c n t + + ;  
                             }  
  
                         i f ( c n t > = C y c l e C o u n t )  
                             {  
                               t a r g e t H i t = t r u e ;  
                             }  
                       }  
                   i f ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y ) < = E q S L )  
                       {  
                         i f ( I s A n y O r d e r A c t i v e ( - 1 ) ! = - 1 )  
                             {  
                               C l o s e A l l O r d e r s ( - 1 ) ;  
                               P r i n t ( " a l l   o r d e r s   a r e   c l o s e d   o n   l o s s   t a r g e t   h i t " ) ;  
                               t a r g e t H i t = t r u e ;  
                             }  
                       }  
                 }  
           }  
  
  
  
  
       s t r i n g   m e s s a g e = " f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f " ;  
       i f ( R e c e i v e ( m e s s a g e , S e r v e r N a m e ) )  
           {  
  
             i f ( c l   | |   t a r g e t H i t )  
                 {  
                   r e t u r n ;  
                 }  
  
             m e s s a g e   =   S t r i n g S u b s t r ( m e s s a g e , 0 , S t r i n g L e n ( m e s s a g e ) - 1 ) ;  
             s t r i n g   t o _ s p l i t = m e s s a g e ;  
             s t r i n g   s e p = " : " ;  
             u s h o r t   u _ s e p ;  
             s t r i n g   r e s u l t [ ] ;  
             s t r i n g   r e s u l t 1 [ ] ;  
  
             u _ s e p = S t r i n g G e t C h a r a c t e r ( s e p , 0 ) ;  
             i n t   k = S t r i n g S p l i t ( t o _ s p l i t , u _ s e p , r e s u l t ) ;  
             / /   P r i n t ( t o _ s p l i t ) ;  
             i f ( k > 0 )  
                 {  
                   f o r ( i n t   i = 0 ;   i < k ;   i + + )  
                       {  
                         s t r i n g   t o _ s p l i t 1 = r e s u l t [ i ] ;  
                         s t r i n g   s e p 1 = " , " ;  
                         u s h o r t   u _ s e p 1 ;  
  
                         u _ s e p 1 = S t r i n g G e t C h a r a c t e r ( s e p 1 , 0 ) ;  
                         i n t   k 1 = S t r i n g S p l i t ( t o _ s p l i t 1 , u _ s e p 1 , r e s u l t 1 ) ;  
                         i f ( k 1 = = 1 0 )  
                             {  
                               s t r i n g   o r d e r I d = r e s u l t 1 [ 0 ] ;  
                               s t r i n g   d i r = r e s u l t 1 [ 1 ] ;  
                               s y m = r e s u l t 1 [ 2 ] ;  
                               d o u b l e   l o t = r e s u l t 1 [ 3 ] ;  
                               d o u b l e   s l = r e s u l t 1 [ 4 ] ;  
                               d o u b l e   t p = r e s u l t 1 [ 5 ] ;  
                               d o u b l e   p r = r e s u l t 1 [ 6 ] ;  
                               i n t   m a g i c N u m b e r = r e s u l t 1 [ 7 ] ;  
                               s t r i n g   c o m m e n t = r e s u l t 1 [ 8 ] ;  
                               l o n g   t i m e = r e s u l t 1 [ 9 ] ;  
  
  
                               s t r i n g   c u r _ s y m b o l = s y m ;  
  
                               i n t   c u r _ s i g O P T y p e =   d i r = = " 0 "   ? 0 : 1 ;  
  
  
  
                               s t r i n g   c u r _ c o m m e n t = " " ;  
                               s t r i n g   t o _ s p l i t 3 = c o m m e n t ;  
                               s t r i n g   s e p 3 = " - " ;  
                               u s h o r t   u _ s e p 3 ;  
                               s t r i n g   r e s u l t 3 [ ] ;  
                               s t r i n g   n e w C o m m e n t = " " ;  
                               u _ s e p 3 = S t r i n g G e t C h a r a c t e r ( s e p 3 , 0 ) ;  
  
                               i n t   k 3 = S t r i n g S p l i t ( t o _ s p l i t 3 , u _ s e p 3 , r e s u l t 3 ) ;  
                               i f ( k 3 > 0 )  
                                   {  
                                     c u r _ c o m m e n t = r e s u l t 3 [ 1 ] ;  
  
                                     n e w C o m m e n t = r e s u l t 3 [ 0 ] + " - " + r e s u l t 3 [ 1 ] + " - " + r e s u l t 3 [ 3 ] + I d e n t i f i e r ;  
                                   }  
                               i n t   t o t a l = O r d e r s T o t a l ( ) ;  
  
                               b o o l   f l a g = f a l s e ;  
  
                               f l a g = G e t F l a g ( n e w C o m m e n t ) ;  
  
                               b o o l   a l l o w e d = f a l s e ;  
  
                               i f ( E n a b l e P a i r S e l e c t i o n )  
                                   {  
                                     i f ( c u r _ s y m b o l = = " E U R U S D " )  
                                         {  
                                           i f ( E U R U S D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( E U R U S D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( E U R U S D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " G B P U S D " )  
                                         {  
                                           i f ( G B P U S D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( G B P U S D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( G B P U S D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " A U D U S D " )  
                                         {  
                                           i f ( A U D U S D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( A U D U S D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( A U D U S D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
  
                                         }  
  
  
                                     i f ( c u r _ s y m b o l = = " U S D J P Y " )  
                                         {  
  
                                           i f ( U S D J P Y _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( U S D J P Y _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( U S D J P Y _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
  
                                                           }  
  
                                         }  
  
  
                                     i f ( c u r _ s y m b o l = = " U S D C H F " )  
                                         {  
                                           i f ( U S D C H F _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( U S D C H F _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( U S D C H F _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " U S D C A D " )  
                                         {  
                                           i f ( U S D C A D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( U S D C A D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( U S D C A D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
  
                                         }  
  
  
                                     i f ( c u r _ s y m b o l = = " E U R A U D " )  
                                         {  
                                           i f ( E U R A U D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( E U R A U D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( E U R A U D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " E U R C A D " )  
                                         {  
                                           i f ( E U R C A D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( E U R C A D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( E U R C A D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " E U R C H F " )  
                                         {  
                                           i f ( E U R C H F _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( E U R C H F _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( E U R C H F _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
  
                                     i f ( c u r _ s y m b o l = = " E U R G B P " )  
                                         {  
                                           i f ( E U R G B P _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( E U R G B P _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( E U R G B P _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " E U R J P Y " )  
                                         {  
                                           i f ( E U R J P Y _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( E U R J P Y _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( E U R J P Y _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " G B P J P Y " )  
                                         {  
                                           i f ( G B P J P Y _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( G B P J P Y _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( G B P J P Y _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " G B P C H F " )  
                                         {  
                                           i f ( G B P C H F _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( G B P C H F _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( G B P C H F _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " N Z D U S D " )  
                                         {  
                                           i f ( N Z D U S D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( N Z D U S D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( N Z D U S D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " A U D C A D " )  
                                         {  
  
                                           i f ( A U D C A D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
  
                                               }  
                                           e l s e  
                                                 i f ( A U D C A D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
  
                                                     }  
                                                 e l s e  
                                                       i f ( A U D C A D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
  
                                                           }  
                                         }  
  
  
                                     i f ( c u r _ s y m b o l = = " A U D J P Y " )  
                                         {  
                                           i f ( A U D J P Y _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
  
                                           e l s e  
                                                 i f ( A U D J P Y _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( A U D J P Y _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " C H F J P Y " )  
                                         {  
                                           i f ( C H F J P Y _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
  
                                                 i f ( C H F J P Y _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( C H F J P Y _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " A U D N Z D " )  
                                         {  
                                           i f ( A U D N Z D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( A U D N Z D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( A U D N Z D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " N Z D J P Y " )  
                                         {  
                                           i f ( N Z D J P Y _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
  
                                                 i f ( N Z D J P Y _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( N Z D J P Y _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
  
                                     i f ( c u r _ s y m b o l = = " N Z D C A D " )  
                                         {  
                                           i f ( N Z D C A D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
  
                                                 i f ( N Z D C A D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( N Z D C A D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " N Z D C H F " )  
                                         {  
                                           i f ( N Z D C H F _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( N Z D C H F _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( N Z D C H F _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " G B P N Z D " )  
                                         {  
                                           i f ( G B P N Z D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( G B P N Z D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( G B P N Z D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
  
                                     i f ( c u r _ s y m b o l = = " E U R N Z D " )  
                                         {  
                                           i f ( E U R N Z D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( E U R N Z D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( E U R N Z D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " G B P C A D " )  
                                         {  
                                           i f ( G B P C A D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
  
                                                 i f ( G B P C A D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( G B P C A D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " G B P A U D " )  
                                         {  
                                           i f ( G B P A U D _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
  
                                                 i f ( G B P A U D _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( G B P A U D _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " A U D C H F " )  
                                         {  
                                           i f ( A U D C H F _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( A U D C H F _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( A U D C H F _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " C A D C H F " )  
                                         {  
                                           i f ( C A D C H F _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( C A D C H F _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( C A D C H F _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
  
                                     i f ( c u r _ s y m b o l = = " C A D J P Y " )  
                                         {  
                                           i f ( C A D J P Y _ A l l o w = = A l l )  
                                               {  
                                                 a l l o w e d = t r u e ;  
                                               }  
                                           e l s e  
                                                 i f ( C A D J P Y _ A l l o w = = B u y 1   & &   c u r _ s i g O P T y p e = = 0 )  
                                                     {  
                                                       a l l o w e d = t r u e ;  
                                                     }  
                                                 e l s e  
                                                       i f ( C A D J P Y _ A l l o w = = S e l l 1   & &   c u r _ s i g O P T y p e = = 1 )  
                                                           {  
                                                             a l l o w e d = t r u e ;  
                                                           }  
                                         }  
                                     i f ( a l l o w e d = = f a l s e )  
                                         {  
                                           P r i n t L o g ( " E n t r y   R e s t r i c t e d   o n   " + c u r _ s y m b o l + "   d u e   t o   S y m b o l   D i r e c t i o n " ) ;  
                                           r e t u r n ;  
                                         }  
                                   }  
  
                               s y m = s y m + P o s t F i x ;  
  
  
                               c u r _ d i g i t s = ( i n t ) S y m b o l I n f o I n t e g e r ( s y m ,   S Y M B O L _ D I G I T S ) ;  
  
  
                               b o o l   C h e c k M a g i c = E n a b l e _ C o p y _ M a g i c ? f a l s e : t r u e ;  
                               i f ( E n a b l e _ C o p y _ M a g i c )  
                                   {  
                                     i n t   s i z e = A r r a y S i z e ( M a g i c L i s t ) ;  
                                     f o r ( i n t   i 1 = 0 ;   i 1 < s i z e ;   i 1 + + )  
                                         {  
                                           C h e c k M a g i c =   ( s t r i n g ) M a g i c L i s t [ i 1 ] = = m a g i c N u m b e r ? t r u e :   f a l s e ;  
                                           i f ( C h e c k M a g i c )  
                                               {  
                                                 b r e a k ;  
                                               }  
                                         }  
                                   }  
  
                               b o o l   C h e c k C o m m e n t = E n a b l e _ C o p y _ C o m m e n t ?   f a l s e :   t r u e ;  
  
  
  
                               i f ( E n a b l e _ C o p y _ C o m m e n t )  
                                   {  
                                     i n t   s i z e = A r r a y S i z e ( C o m m e n t L i s t ) ;  
                                     f o r ( i n t   i 2 = 0 ;   i 2 < s i z e ;   i 2 + + )  
                                         {  
                                           C h e c k C o m m e n t =   ( s t r i n g ) C o m m e n t L i s t [ i 2 ] . c m n t = = c u r _ c o m m e n t ? t r u e :   f a l s e ;  
                                           i f ( C h e c k C o m m e n t )  
                                               {  
                                                 b r e a k ;  
                                               }  
                                         }  
                                   }  
  
                               b o o l   r e t = f a l s e ;  
  
                               i f ( C h e c k M a g i c = = f a l s e )  
                                   {  
                                     P r i n t L o g ( " E n t r y   R e s t r i c t e d   o n   " + c u r _ s y m b o l + "   d u e   t o    M a g i c   N u m b e r "   + "   " +   m a g i c N u m b e r ) ;  
                                     r e t = t r u e ;  
                                   }  
  
                               i f ( C h e c k C o m m e n t = = f a l s e )  
                                   {  
                                     P r i n t L o g ( " E n t r y   R e s t r i c t e d   o n   " + c u r _ s y m b o l + "   d u e   t o    C o m m e n t " + "   " +   c u r _ c o m m e n t ) ;  
                                     r e t = t r u e ;  
                                   }  
  
                               i f ( r e t )  
                                   {  
                                     c o n t i n u e ;  
                                   }  
  
  
                               i f ( E n a b l e _ R i s k _ P e r _ C o m m e n t )  
                                   {  
                                     i n t   s i z e = A r r a y S i z e ( C o m m e n t L i s t ) ;  
                                     f o r ( i n t   i 1 = 0 ;   i 1 < s i z e ;   i 1 + + )  
                                         {  
                                           b o o l   C h e c k C o m m e n t =   ( s t r i n g ) C o m m e n t L i s t [ i 1 ] . c m n t = = c u r _ c o m m e n t ? t r u e :   f a l s e ;  
                                           i f ( C h e c k C o m m e n t )  
                                               {  
                                                 R i s k P e r c e n t = C o m m e n t L i s t [ i 1 ] . p r ;  
                                                 b r e a k ;  
                                               }  
                                         }  
                                   }  
  
  
  
                               i f ( U s e I n p u t M a g i c N u m b e r )  
                                   {  
                                     m a g i c N u m b e r = M a g i c N u m b e r ;  
                                   }  
  
  
                               i f ( f l a g = = f a l s e )  
                                   {  
                                     i f ( t i m e < L a t e n c y )  
                                         {  
  
                                           i f ( D o e s S i g n a l C a t c h e d ( s y m ,   c u r _ s i g O P T y p e ,   r a t e s [ 0 ] . t i m e ) ! = - 1 )  
                                               {  
                                                 P r i n t ( ( c u r _ s i g O P T y p e = = O P _ B U Y ? " B u y " : " S e l l " ) + "   e n t r y   o n   " + c u r _ s y m b o l + "   i s   s k i p p e d   o n   t r a d e   a l r e a d y   p l a c e d   o n   s a m e   c a n d l e " ) ;  
                                               }  
                                           e l s e  
                                               {  
  
                                                 s t r i n g   C m t A r r a y [ ] ;  
                                                 i n t   k 3   =   S t r i n g S p l i t ( c o m m e n t , S t r i n g G e t C h a r a c t e r ( " # " , 0 ) , C m t A r r a y ) ;  
  
                                                 d o u b l e   c m t S L   =   ( d o u b l e ) C m t A r r a y [ 1 ] ;  
  
                                                 l o t =   G e t P o s i t i o n S i z i n g L o t ( ( M a t h A b s ( c m t S L ) - ( M a t h A b s ( S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ A S K ) - S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ B I D ) ) * S p r e a d M u l t i p l i e r ) ) , m a g i c N u m b e r ) ;  
  
  
                                                 i f ( d i r = = " 0 " )  
                                                     {  
  
                                                       i f ( t r a d e . B u y ( N o r m a l i z e D o u b l e ( l o t , 2 ) , s y m , S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ A S K ) , 0 , 0 , n e w C o m m e n t ) )  
                                                           {  
                                                             P r i n t ( " P o s i t i o n   S e n d   f a i l e d   w i t h   e r r o r   # " , G e t L a s t E r r o r ( ) , "   R e s u l t R e t c o d e   " , t r a d e . R e s u l t R e t c o d e ( ) ) ;  
                                                           }  
                                                       e l s e  
                                                           {  
                                                             l o n g   t i c k e t = P o s i t i o n G e t T i c k e t ( P o s i t i o n s T o t a l ( ) - 1 ) ;  
                                                             d o u b l e   s p r e a d =   M a t h A b s ( S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ A S K ) - S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ B I D ) ) ;  
                                                             d o u b l e   S p r e a d B a s e d S L =   c m t S L - ( M a t h A b s ( S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ A S K ) - S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ B I D ) ) * S p r e a d M u l t i p l i e r ) ;  
                                                             P r i n t ( " S p r e a d   M u l t i p l i e r   T i c k e t :   " + t i c k e t + "   M a s t e r   P i p s   D i f f e r e n c e :   " +   c m t S L + "   S p r e a d   S u b t r a c t o r   M u l t i p l i e r :   " + S p r e a d M u l t i p l i e r   + "   C u r r e n t   S p r e a d :   " + D o u b l e T o S t r i n g ( s p r e a d , 8 )   + "   F i n a l   P i p s   S L :   " + D o u b l e T o S t r i n g ( S p r e a d B a s e d S L , 8 ) ) ;  
  
                                                             d o u b l e   s l 2 =   p r - ( c m t S L * M u l t i p l i e r ) ;  
                                                             d o u b l e   f p = ( c m t S L * M u l t i p l i e r ) ;  
                                                             P r i n t ( " F a k e   S L   T i c k e t :   " + t i c k e t + "   F a k e   S L   M u l t i p l i e r :   " +   M u l t i p l i e r + "   O r i g i n a l   S L   V a l u e :   " + c m t S L   + "   F a k e   S L   V a l u e :   " + s l 2   + "   F a k e   S L   P i p s :   " + f p ) ;  
                                                             P r i n t ( " O r d e r   p l a c e d   s u c c e s s f u l l y " ) ;  
                                                           }  
                                                     }  
                                                 e l s e  
                                                       i f ( d i r = = " 1 " )  
                                                           {  
                                                             i f ( t r a d e . S e l l ( N o r m a l i z e D o u b l e ( l o t , 2 ) , s y m , S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ B I D ) , 0 , 0 , n e w C o m m e n t ) )  
                                                                 {  
                                                                   P r i n t ( " P o s i t i o n   S e n d   f a i l e d   w i t h   e r r o r   # " , G e t L a s t E r r o r ( ) ) ;  
                                                                 }  
                                                             e l s e  
                                                                 {  
                                                                   l o n g   t i c k e t = P o s i t i o n G e t T i c k e t ( P o s i t i o n s T o t a l ( ) - 1 ) ;  
                                                                   d o u b l e   s p r e a d =   M a t h A b s ( S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ A S K ) - S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ B I D ) ) ;  
                                                                   d o u b l e   S p r e a d B a s e d S L =   c m t S L - ( M a t h A b s ( S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ A S K ) - S y m b o l I n f o D o u b l e ( s y m , S Y M B O L _ B I D ) ) * S p r e a d M u l t i p l i e r ) ;  
                                                                   P r i n t ( " S p r e a d   M u l t i p l i e r   T i c k e t :   " + t i c k e t + "   M a s t e r   P i p s   D i f f e r e n c e :   " +   c m t S L + "   S p r e a d   S u b t r a c t o r   M u l t i p l i e r :   " + S p r e a d M u l t i p l i e r   + "   C u r r e n t   S p r e a d :   " + D o u b l e T o S t r i n g ( s p r e a d , 8 )   + "   F i n a l   P i p s   S L :   " + D o u b l e T o S t r i n g ( S p r e a d B a s e d S L , 8 ) ) ;  
  
                                                                   d o u b l e   s l 2 =   p r + ( c m t S L * M u l t i p l i e r ) ;  
                                                                   d o u b l e   f p = ( c m t S L * M u l t i p l i e r ) ;  
                                                                   P r i n t ( " F a k e   S L     T i c k e t :   " + t i c k e t + "   F a k e   S L   M u l t i p l i e r :   " +   M u l t i p l i e r + "   O r i g i n a l   S L   V a l u e :   " + c m t S L   + "   F a k e   S L   V a l u e :   " + s l 2   + "   F a k e   S L   P i p s :   " + f p ) ;  
  
                                                                   P r i n t ( " O r d e r   p l a c e d   s u c c e s s f u l l y " ) ;  
                                                                 }  
                                                           }  
                                               }  
                                         }  
                                     e l s e  
                                         {  
                                           i f ( t i m e < 3 0 0 )  
                                               {  
                                                 P r i n t L o g ( s y m +   "   E n t r y   s k i p p e d   d u e   t o   l a t e n c y " ) ;  
                                               }  
                                         }  
                                   }  
  
                               i f ( f l a g )  
                                   {  
                                     f o r ( i n t   a = 0 ;   a < P o s i t i o n s T o t a l ( ) ;   a + + )  
                                         {  
                                           l o n g   t i c k e t _ = P o s i t i o n G e t T i c k e t ( i ) ;  
                                           i f ( t i c k e t _ > 0 )  
                                               {  
                                                 i f ( P o s i t i o n G e t S t r i n g ( P O S I T I O N _ C O M M E N T ) = = n e w C o m m e n t )  
                                                     {  
                                                       i f ( P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T Y P E ) = = O P _ B U Y )  
                                                           {  
  
                                                             s t r i n g   C m t A r r a y [ ] ;  
  
                                                             i n t   k 3   =   S t r i n g S p l i t ( P o s i t i o n G e t S t r i n g ( P O S I T I O N _ C O M M E N T ) , S t r i n g G e t C h a r a c t e r ( " # " , 0 ) , C m t A r r a y ) ;  
  
  
                                                             d o u b l e   c m t S L   =   ( d o u b l e ) C m t A r r a y [ 1 ] ;  
  
  
                                                             i f ( F a k e S L )  
                                                                 {  
                                                                   s l = p r - ( M a t h A b s ( c m t S L ) * M u l t i p l i e r ) ;  
                                                                 }  
  
                                                             i f ( P o s i t i o n G e t D o u b l e ( P O S I T I O N _ S L ) ! = N o r m a l i z e D o u b l e ( s l , S y m b o l I n f o I n t e g e r ( s y m ,   S Y M B O L _ D I G I T S ) ) )  
                                                                 {  
  
                                                                   b o o l   r e s =     t r a d e . P o s i t i o n M o d i f y ( t i c k e t _ , N o r m a l i z e D o u b l e ( s l , S y m b o l I n f o I n t e g e r ( s y m ,   S Y M B O L _ D I G I T S ) ) , P o s i t i o n G e t D o u b l e ( P O S I T I O N _ T P ) ) ;  
                                                                   i f ( r e s = = f a l s e )  
                                                                       {  
                                                                         P r i n t ( " P o s i t i o n M o d i f y   f a i l e d   w i t h   e r r o r   # " , G e t L a s t E r r o r ( ) , "   r e s u l t R e t c o d e   " , t r a d e . R e s u l t R e t c o d e ( ) ) ;  
                                                                       }  
                                                                   e l s e  
                                                                       {  
                                                                         P r i n t ( " P o s i t i o n   S t o p   L o s s   m o d i f i e d   s u c c e s s f u l l y " ) ;  
                                                                         b r e a k ;  
                                                                       }  
                                                                 }  
  
                                                             i f ( P o s i t i o n G e t D o u b l e ( P O S I T I O N _ S L ) ! = N o r m a l i z e D o u b l e ( t p , S y m b o l I n f o I n t e g e r ( s y m ,   S Y M B O L _ D I G I T S ) ) )  
                                                                 {  
                                                                   b o o l   r e s =     t r a d e . P o s i t i o n M o d i f y ( t i c k e t _ , P o s i t i o n G e t D o u b l e ( P O S I T I O N _ S L ) , N o r m a l i z e D o u b l e ( t p , S y m b o l I n f o I n t e g e r ( s y m ,   S Y M B O L _ D I G I T S ) ) ) ;  
                                                                   i f ( r e s = = f a l s e )  
                                                                       {  
                                                                         P r i n t ( " P o s i t i o n M o d i f y   f a i l e d   w i t h   e r r o r   # " , G e t L a s t E r r o r ( ) ) ;  
                                                                       }  
                                                                   e l s e  
                                                                       {  
                                                                         P r i n t ( " P o s i t i o n   T a k e   P r o f i t   m o d i f i e d   s u c c e s s f u l l y " ) ;  
                                                                         b r e a k ;  
                                                                       }  
                                                                 }  
                                                           }  
                                                       i f ( P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T Y P E )   = =   O P _ S E L L )  
                                                           {  
                                                             s t r i n g   C m t A r r a y [ ] ;  
  
                                                             i n t   k 3   =   S t r i n g S p l i t ( P o s i t i o n G e t S t r i n g ( P O S I T I O N _ C O M M E N T ) , S t r i n g G e t C h a r a c t e r ( " # " , 0 ) , C m t A r r a y ) ;  
  
  
                                                             d o u b l e   c m t S L   =   ( d o u b l e ) C m t A r r a y [ 1 ] ;  
  
                                                             i f ( F a k e S L )  
                                                                 {  
                                                                   s l = p r + ( M a t h A b s ( c m t S L ) * M u l t i p l i e r ) ;  
                                                                 }  
  
                                                             i f ( P o s i t i o n G e t D o u b l e ( P O S I T I O N _ S L ) ! = N o r m a l i z e D o u b l e ( s l , S y m b o l I n f o I n t e g e r ( s y m ,   S Y M B O L _ D I G I T S ) ) )  
                                                                 {  
  
                                                                   b o o l   r e s =     t r a d e . P o s i t i o n M o d i f y ( t i c k e t _ , N o r m a l i z e D o u b l e ( s l , S y m b o l I n f o I n t e g e r ( s y m ,   S Y M B O L _ D I G I T S ) ) , P o s i t i o n G e t D o u b l e ( P O S I T I O N _ T P ) ) ;  
                                                                   i f ( r e s = = f a l s e )  
                                                                       {  
                                                                         P r i n t ( " P o s i t i o n M o d i f y   f a i l e d   w i t h   e r r o r   # " , G e t L a s t E r r o r ( ) , "   r e s u l t R e t c o d e   " , t r a d e . R e s u l t R e t c o d e ( ) ) ;  
                                                                       }  
                                                                   e l s e  
                                                                       {  
                                                                         P r i n t ( " P o s i t i o n   S t o p   L o s s   m o d i f i e d   s u c c e s s f u l l y " ) ;  
                                                                         b r e a k ;  
                                                                       }  
                                                                 }  
  
                                                             i f ( P o s i t i o n G e t D o u b l e ( P O S I T I O N _ S L ) ! = N o r m a l i z e D o u b l e ( t p , S y m b o l I n f o I n t e g e r ( s y m ,   S Y M B O L _ D I G I T S ) ) )  
                                                                 {  
                                                                   b o o l   r e s =     t r a d e . P o s i t i o n M o d i f y ( t i c k e t _ , P o s i t i o n G e t D o u b l e ( P O S I T I O N _ S L ) , N o r m a l i z e D o u b l e ( t p , S y m b o l I n f o I n t e g e r ( s y m ,   S Y M B O L _ D I G I T S ) ) ) ;  
                                                                   i f ( r e s = = f a l s e )  
                                                                       {  
                                                                         P r i n t ( " P o s i t i o n M o d i f y   f a i l e d   w i t h   e r r o r   # " , G e t L a s t E r r o r ( ) ) ;  
                                                                       }  
                                                                   e l s e  
                                                                       {  
                                                                         P r i n t ( " P o s i t i o n   T a k e   P r o f i t   m o d i f i e d   s u c c e s s f u l l y " ) ;  
                                                                         b r e a k ;  
                                                                       }  
                                                                 }  
  
                                                           }  
                                                     }  
                                               }  
                                         }  
  
  
                                   }  
                             }  
                       }  
                 }  
  
  
             i f ( M a s t e r T r a d e C l o s e )  
                 {  
                   i n t   t o t a l = P o s i t i o n s T o t a l ( ) ;  
  
  
                   b o o l   f l a g 1 = f a l s e ;  
                   f o r ( i n t   p o s = 0 ;   p o s < t o t a l ;   p o s + + )  
                       {  
                         f l a g 1 = f a l s e ;  
  
                         i f ( P o s i t i o n G e t T i c k e t ( p o s ) > 0 )  
                               c o n t i n u e ;  
  
                         s t r i n g   o r d C o m m e n t = P o s i t i o n G e t S t r i n g ( P O S I T I O N _ C O M M E N T ) ;  
                         f o r ( i n t   i = 0 ;   i < k ;   i + + )  
                             {  
                               s t r i n g   t o _ s p l i t 1 = r e s u l t [ i ] ;  
  
                               s t r i n g   s e p 1 = " , " ;  
                               u s h o r t   u _ s e p 1 ;  
  
                               u _ s e p 1 = S t r i n g G e t C h a r a c t e r ( s e p 1 , 0 ) ;  
                               i n t   k 1 = S t r i n g S p l i t ( t o _ s p l i t 1 , u _ s e p 1 , r e s u l t 1 ) ;  
  
                               i f ( k 1 = = 1 0 )  
                                   {  
                                     s t r i n g   o r d e r I d = r e s u l t 1 [ 0 ] ;  
                                     s t r i n g   d i r = r e s u l t 1 [ 1 ] ;  
                                     s t r i n g   c o m m e n t = r e s u l t 1 [ 8 ] ;  
  
                                     / / P r i n t ( O r d e r S y m b o l ( ) + "   " +   c o m m e n t + "   " +   t o _ s p l i t 1   + "   " + i + "     " +   o r d C o m m e n t   ) ;  
                                     s t r i n g   c u r _ c o m m e n t = " " ;  
                                     s t r i n g   t o _ s p l i t 3 = c o m m e n t ;  
                                     s t r i n g   s e p 3 = " - " ;  
                                     u s h o r t   u _ s e p 3 ;  
                                     s t r i n g   r e s u l t 3 [ ] ;  
  
                                     s t r i n g   n e w C o m m e n t = " " ;  
                                     u _ s e p 3 = S t r i n g G e t C h a r a c t e r ( s e p 3 , 0 ) ;  
  
                                     i n t   k 3 = S t r i n g S p l i t ( t o _ s p l i t 3 , u _ s e p 3 , r e s u l t 3 ) ;  
                                     i f ( k 3 > 0 )  
                                         {  
                                           c u r _ c o m m e n t = r e s u l t 3 [ 1 ] ;  
  
                                           n e w C o m m e n t = r e s u l t 3 [ 0 ] + " - " + c u r _ c o m m e n t + " - " + r e s u l t 3 [ 3 ] + I d e n t i f i e r ;  
                                         }  
                                     / /   P r i n t ( O r d e r S y m b o l ( ) + "   " + f l a g 1 + "   " +   O r d e r E x i s t ( n e w C o m m e n t ) + "   " +   n e w C o m m e n t   + "   " +   o r d C o m m e n t ) ;  
                                     i f ( o r d C o m m e n t = = n e w C o m m e n t )  
                                         {  
                                           f l a g 1 = t r u e ;  
                                           b r e a k ;  
                                         }  
                                   }  
                             }  
                         / / P r i n t ( O r d e r S y m b o l ( ) + "   o k   " + f l a g 1 ) ;  
  
                         i f ( m e s s a g e ! = " " )  
                             {  
                               i f ( f l a g 1 = = f a l s e   | |   m e s s a g e = = " E m p t " )  
                                   {  
                                     / / P r i n t ( O r d e r S y m b o l ( ) + "   o k   " + f l a g 1 ) ;  
                                     i f ( m e s s a g e = = " E m p t " )  
                                         {  
                                           i f ( S t r i n g F i n d ( P o s i t i o n G e t S t r i n g ( P O S I T I O N _ C O M M E N T ) , I d e n t i f i e r ) = = - 1 )  
                                               {  
                                                 c o n t i n u e ;  
                                               }  
                                         }  
  
                                     b o o l   r e s =   t r a d e . P o s i t i o n C l o s e ( P o s i t i o n G e t T i c k e t ( p o s ) , - 1 ) ;  
                                     i f ( r e s = = f a l s e )  
                                         {  
                                           P r i n t ( " O r d e r   C l o s e   f a i l e d   w i t h   e r r o r   # " , G e t L a s t E r r o r ( ) , "   r e s u l t R e t C o d e   " , t r a d e . R e s u l t R e t c o d e ( ) ) ;  
                                         }  
                                     e l s e  
                                           P r i n t ( " O r d e r   c l o s e d   s u c c e s s f u l l y   b y   m a s t e r " ) ;  
  
                                   }  
                             }  
                       }  
  
                   i n t   o r d e r s T o t a l = O r d e r s T o t a l ( ) ;  
                   f o r ( i n t   p o s = 0 ;   p o s < o r d e r s T o t a l ;   p o s + + )  
                       {  
                         f l a g 1 = f a l s e ;  
  
                         i f ( O r d e r G e t T i c k e t ( p o s ) > 0 )  
                               c o n t i n u e ;  
  
                         s t r i n g   o r d C o m m e n t = O r d e r G e t S t r i n g ( O R D E R _ C O M M E N T ) ;  
                         f o r ( i n t   i = 0 ;   i < k ;   i + + )  
                             {  
                               s t r i n g   t o _ s p l i t 1 = r e s u l t [ i ] ;  
  
                               s t r i n g   s e p 1 = " , " ;  
                               u s h o r t   u _ s e p 1 ;  
  
                               u _ s e p 1 = S t r i n g G e t C h a r a c t e r ( s e p 1 , 0 ) ;  
                               i n t   k 1 = S t r i n g S p l i t ( t o _ s p l i t 1 , u _ s e p 1 , r e s u l t 1 ) ;  
  
                               i f ( k 1 = = 1 0 )  
                                   {  
                                     s t r i n g   o r d e r I d = r e s u l t 1 [ 0 ] ;  
                                     s t r i n g   d i r = r e s u l t 1 [ 1 ] ;  
                                     s t r i n g   c o m m e n t = r e s u l t 1 [ 8 ] ;  
  
                                     / / P r i n t ( O r d e r S y m b o l ( ) + "   " +   c o m m e n t + "   " +   t o _ s p l i t 1   + "   " + i + "     " +   o r d C o m m e n t   ) ;  
                                     s t r i n g   c u r _ c o m m e n t = " " ;  
                                     s t r i n g   t o _ s p l i t 3 = c o m m e n t ;  
                                     s t r i n g   s e p 3 = " - " ;  
                                     u s h o r t   u _ s e p 3 ;  
                                     s t r i n g   r e s u l t 3 [ ] ;  
  
                                     s t r i n g   n e w C o m m e n t = " " ;  
                                     u _ s e p 3 = S t r i n g G e t C h a r a c t e r ( s e p 3 , 0 ) ;  
  
                                     i n t   k 3 = S t r i n g S p l i t ( t o _ s p l i t 3 , u _ s e p 3 , r e s u l t 3 ) ;  
                                     i f ( k 3 > 0 )  
                                         {  
                                           c u r _ c o m m e n t = r e s u l t 3 [ 1 ] ;  
  
                                           n e w C o m m e n t = r e s u l t 3 [ 0 ] + " - " + c u r _ c o m m e n t + " - " + r e s u l t 3 [ 3 ] + I d e n t i f i e r ;  
                                         }  
                                     / /   P r i n t ( O r d e r S y m b o l ( ) + "   " + f l a g 1 + "   " +   O r d e r E x i s t ( n e w C o m m e n t ) + "   " +   n e w C o m m e n t   + "   " +   o r d C o m m e n t ) ;  
                                     i f ( o r d C o m m e n t = = n e w C o m m e n t )  
                                         {  
                                           f l a g 1 = t r u e ;  
                                           b r e a k ;  
                                         }  
                                   }  
                             }  
                         / / P r i n t ( O r d e r S y m b o l ( ) + "   o k   " + f l a g 1 ) ;  
  
                         i f ( m e s s a g e ! = " " )  
                             {  
                               i f ( f l a g 1 = = f a l s e   | |   m e s s a g e = = " E m p t " )  
                                   {  
                                     / / P r i n t ( O r d e r S y m b o l ( ) + "   o k   " + f l a g 1 ) ;  
                                     i f ( m e s s a g e = = " E m p t " )  
                                         {  
                                           i f ( S t r i n g F i n d ( O r d e r G e t S t r i n g ( O R D E R _ C O M M E N T ) , I d e n t i f i e r ) = = - 1 )  
                                               {  
                                                 c o n t i n u e ;  
                                               }  
                                         }  
                                     l o n g   t y p e = O r d e r G e t I n t e g e r ( O R D E R _ T Y P E ) ;  
                                     i f ( t y p e = = O P _ B U Y L I M I T   | |   t y p e = = O P _ S E L L L I M I T   | |   t y p e = = O P _ B U Y S T O P   | |   t y p e = = O P _ S E L L S T O P )  
                                         {  
                                           b o o l   r e s =   t r a d e . O r d e r D e l e t e ( O r d e r G e t T i c k e t ( p o s ) ) ;  
                                           i f ( r e s = = f a l s e )  
                                               {  
                                                 P r i n t ( " O r d e r   D e l e t e   f a i l e d   w i t h   e r r o r   # " , G e t L a s t E r r o r ( ) , "   r e s u l t R e t C o d e   " , t r a d e . R e s u l t R e t c o d e ( ) ) ;  
                                               }  
                                           e l s e  
                                                 P r i n t ( " P e n d i n g   O r d e r   d e l e t e d   s u c c e s s f u l l y   b y   m a s t e r " ) ;  
                                         }  
  
                                   }  
                             }  
                       }  
  
  
  
                 }  
  
           }  
  
  
     }  
  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 d o u b l e   G e t P o s i t i o n S i z i n g L o t ( d o u b l e   s l _ d i f f , i n t   m a g i c N u m b e r )  
     {  
  
       d o u b l e   f i n a l _ l o t   =   0 ;  
       d o u b l e   r i s k P e r c e n t = R i s k P e r c e n t ;  
       i f ( I n c r e a s e R i s k O n L o s s )  
           {  
             i n t   l o s s = G e t L o s s C o u n t ( s y m ,   - 1 ,   m a g i c N u m b e r ) ;  
             i f ( l o s s > 0 )  
                 {  
                   r i s k P e r c e n t = M a t h P o w ( R i s k I n c r e a s e M u l t i p l i e r ,   l o s s ) * R i s k P e r c e n t ;  
                 }  
           }  
  
  
       d o u b l e   r i s k P   =   ( r i s k P e r c e n t / 1 0 0 ) ;  
       d o u b l e   A m o u n t A t R i s k   =   ( R i s k F r o m = = R i s k E q u i t y )   ?   ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ E Q U I T Y )   *   r i s k P )   :   ( R i s k F r o m = = R i s k A c c B a l )   ?   ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E )   *   r i s k P )   :   0 ;  
       i f ( E n a b l e F u n d e d A c c o u n t )  
             A m o u n t A t R i s k   =   M a t h M i n ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ,   F u n d e d A c c o u n t B a l a n c e )   *   r i s k P ;  
       d o u b l e   p v = S y m b o l I n f o D o u b l e ( s y m ,   S Y M B O L _ T R A D E _ T I C K _ V A L U E ) / S y m b o l I n f o D o u b l e ( s y m ,   S Y M B O L _ T R A D E _ T I C K _ S I Z E ) ;  
       f i n a l _ l o t = A m o u n t A t R i s k / ( p v * s l _ d i f f ) ;  
       i n t   d p = G e t D e c i m a l P o i n t s ( s y m ) ;  
       s t r i n g   m s g = " C a l c u l a t e d   l o t s   f i n a l _ l o t = " +   D o u b l e T o S t r i n g ( f i n a l _ l o t ,   4 ) + "   A m o u n t A t R i s k = " + D o u b l e T o S t r i n g ( A m o u n t A t R i s k ,   2 ) + "   s l _ d i f f = " + D o u b l e T o S t r i n g ( s l _ d i f f ,   c u r _ d i g i t s ) ;  
       i f ( f i n a l _ l o t < S y m b o l I n f o D o u b l e ( s y m ,   S Y M B O L _ V O L U M E _ M I N ) )  
           {  
             d o u b l e   r i s k V a l u e = p v * S y m b o l I n f o D o u b l e ( s y m ,   S Y M B O L _ V O L U M E _ M I N ) * s l _ d i f f ;  
             d o u b l e   m i n B a l a n c e = r i s k V a l u e * 1 0 0 / r i s k P e r c e n t ;  
             / / P r i n t ( r i s k V a l u e ,   " ,   " ,   p v ,   " ,   " ,   r i s k P e r c e n t ,   " ,   " ,   S y m b o l I n f o D o u b l e ( c u r _ s y m b o l ,   S Y M B O L _ V O L U M E _ M I N ) ,   " ,   " ,   s l _ d i f f ) ;  
             m s g = m s g + " ,   m i n   b a l a n c e   n e e d e d = " + D o u b l e T o S t r i n g ( m i n B a l a n c e ,   2 ) ;  
             f i n a l _ l o t = 0 ;  
           }  
       P r i n t ( m s g ) ;  
       i f ( E n a b l e F u n d e d A c c o u n t )  
           {  
             d o u b l e   p r e v _ l o t = f i n a l _ l o t ;  
             f i n a l _ l o t = M a t h F l o o r ( f i n a l _ l o t * M a t h P o w ( 1 0 ,   d p ) ) / M a t h P o w ( 1 0 ,   d p ) ;  
             P r i n t ( " l o t   i s   r o u n d e d   d o w n   f r o m   " + D o u b l e T o S t r i n g ( p r e v _ l o t ,   4 ) + "   t o   " + D o u b l e T o S t r i n g ( f i n a l _ l o t ,   d p ) ) ;  
           }  
       e l s e  
             f i n a l _ l o t = N o r m a l i z e D o u b l e ( f i n a l _ l o t ,   d p ) ; / / M a t h F l o o r ( f i n a l _ l o t * M a t h P o w ( 1 0 ,   d p ) ) / M a t h P o w ( 1 0 ,   d p ) ;  
       r e t u r n   f i n a l _ l o t ;  
     }  
  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |                                                                                                                                     |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 i n t   G e t D e c i m a l P o i n t s ( s t r i n g   s y m b o l )  
     {  
 / / - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
       w h i l e ( S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ V O L U M E _ S T E P ) = = 0 )  
             S l e e p ( 2 0 0 0 ) ;  
       i n t   d p   =   0 ;  
       d o u b l e   x   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ V O L U M E _ S T E P ) ;  
       w h i l e ( x   <   1 )  
           {   x   * =   1 0 ;   d p   + =   1 ;   }  
       r e t u r n   ( d p ) ;  
 / / - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
     }  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |                                                                                                                                     |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 i n t   G e t L o s s C o u n t ( s t r i n g   s y m b o l ,   i n t   t y p e , i n t   m a g i c N u m b e r )  
     {  
       i n t   c o u n t = 0 ;  
       f o r ( i n t   i = P o s i t i o n s T o t a l ( ) - 1 ;   i > = 0 ;   i - - )  
             i f ( P o s i t i o n G e t T i c k e t ( i ) > 0 )  
                   i f ( P o s i t i o n G e t S t r i n g ( P O S I T I O N _ S Y M B O L ) = = s y m b o l   & &   P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ M A G I C ) = = m a g i c N u m b e r )  
                         i f ( t y p e = = - 1   | |   P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T Y P E ) = = t y p e )  
                             {  
                               i f ( P o s i t i o n G e t D o u b l e ( P O S I T I O N _ P R O F I T ) < 0 )  
                                     c o u n t + + ;  
                               e l s e  
                                     b r e a k ;  
                             }  
       r e t u r n   ( c o u n t ) ;  
     }  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |                                                                                                                                     |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 i n t   I s A n y O r d e r A c t i v e ( i n t   t y p e )  
     {  
       i f ( t y p e < 2   | |   t y p e = = - 1 )  
           {  
             f o r ( i n t   i = P o s i t i o n s T o t a l ( ) - 1 ;   i > = 0 ;   i - - )  
                   i f ( P o s i t i o n G e t T i c k e t ( i ) > 0 )  
                         i f ( t y p e = = - 1   | |   P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T Y P E ) = = t y p e )  
                               r e t u r n   ( P o s i t i o n G e t T i c k e t ( i ) ) ;  
           }  
       i f ( t y p e = = - 1   | |   t y p e > = 2 )  
           {  
             f o r ( i n t   i = O r d e r s T o t a l ( ) - 1 ;   i > = 0 ;   i - - )  
                   i f ( O r d e r G e t T i c k e t ( i ) > 0 )  
                         i f ( t y p e = = - 1   | |   O r d e r G e t I n t e g e r ( O R D E R _ T Y P E ) = = t y p e )  
                               r e t u r n   ( P o s i t i o n G e t T i c k e t ( i ) ) ;  
           }  
       r e t u r n   ( - 1 ) ;  
     }  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |                                                                                                                                     |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 v o i d   C l o s e A l l O r d e r s ( i n t   t y p e )  
     {  
       b o o l   a n y C l o s e d   =   f a l s e ;  
       i n t   d e l a y = 2 0 0 ,   t r i e s = 0 ;  
       w h i l e ( I s A n y O r d e r A c t i v e ( t y p e ) ! = - 1   & &   t r i e s < 1 0 0 )  
           {  
             f o r ( i n t   i = P o s i t i o n s T o t a l ( ) - 1 ;   i > = 0 ;   i - - )  
                   i f ( P o s i t i o n G e t T i c k e t ( i ) > 0 )  
                         i f ( t y p e = = - 1   | |   P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T Y P E ) = = t y p e )  
                             {  
                               i n t   t i c k e t = P o s i t i o n G e t T i c k e t ( i ) ;  
                               / / R e f r e s h R a t e s ( ) ;  
                               b o o l   _ r e s ;  
                               _ r e s = t r a d e . P o s i t i o n C l o s e ( t i c k e t , - 1 ) ;  
                               a n y C l o s e d = t r u e ;  
                             }  
  
             f o r ( i n t   i = O r d e r s T o t a l ( ) - 1 ;   i > = 0 ;   i - - )  
                   i f ( O r d e r G e t T i c k e t ( i ) > 0 )  
                         i f ( t y p e = = - 1   | |   O r d e r G e t I n t e g e r ( O R D E R _ T Y P E ) = = t y p e )  
                             {  
                               i n t   t i c k e t = O r d e r G e t T i c k e t ( i ) ;  
                               / / R e f r e s h R a t e s ( ) ;  
                               b o o l   _ r e s ;  
                               _ r e s = t r a d e . O r d e r D e l e t e ( t i c k e t ) ;  
                               a n y C l o s e d = t r u e ;  
                             }  
             t r i e s   + + ;  
           }  
     }  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |                                                                                                                                     |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 v o i d   P r i n t L o g ( s t r i n g   m s g )  
     {  
       i f ( E n a b l e L o g )  
           {  
             P r i n t ( m s g ) ;  
           }  
  
     }  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |                                                                                                                                     |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 b o o l   O r d e r E x i s t ( s t r i n g   c o m m e n t )  
     {  
       i n t   t o t a l = O r d e r s T o t a l ( ) ;  
  
       b o o l   f l a g 1 = f a l s e ;  
       f o r ( i n t   p o s = 0 ;   p o s < t o t a l ;   p o s + + )  
           {  
             i f ( O r d e r G e t T i c k e t ( p o s ) < = 0 )  
                   c o n t i n u e ;  
  
             i f ( S t r i n g F i n d ( O r d e r G e t S t r i n g ( O R D E R _ C O M M E N T ) , c o m m e n t ) ! = - 1 )  
                 {  
                   f l a g 1 = t r u e ;  
                   r e t u r n   f l a g 1 ;  
                 }  
           }  
  
       t o t a l = P o s i t i o n s T o t a l ( ) ;  
       f o r ( i n t   p o s = 0 ;   p o s < t o t a l ;   p o s + + )  
           {  
             i f ( P o s i t i o n G e t T i c k e t ( p o s ) < = 0 )  
                   c o n t i n u e ;  
  
             i f ( S t r i n g F i n d ( P o s i t i o n G e t S t r i n g ( P O S I T I O N _ C O M M E N T ) , c o m m e n t ) ! = - 1 )  
                 {  
                   f l a g 1 = t r u e ;  
                   r e t u r n   f l a g 1 ;  
                 }  
           }  
  
       r e t u r n   f l a g 1 ;  
     }  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 d o u b l e   P r i c e T o P i p ( s t r i n g   s y m b o l )  
     {  
  
       s t r i n g                   p i p F a c t o r [ ]     =   { " B T C U S D " , " E T H U S D " , " J P Y " , " X A G " , " S I L V E R " , " B R E N T " , " W T I " , " X A U " , " G O L D " , " S P 5 0 0 " , " S & P " , " U K 1 0 0 " , " W S 3 0 " , " D A X 3 0 " , " D J 3 0 " , " N A S 1 0 0 " , " C A C 4 0 0 " , " I n d e x " } ;  
       d o u b l e                   p i p F a c t o r s [ ]   =   {   1 0 , 1 0 , 1 0 0 ,     1 0 0 ,     1 0 0 ,           1 0 0 ,         1 0 0 ,     1 0 ,       1 0 ,         1 0 ,           1 0 ,       1 ,             1 ,           1 ,             1 ,           1 ,               1 ,   1 } ;  
  
       f o r ( i n t   i = A r r a y S i z e ( p i p F a c t o r ) - 1 ;   i > = 0 ;   i - - )  
             i f ( S t r i n g F i n d ( s y m b o l , p i p F a c t o r [ i ] , 0 ) ! = - 1 )  
                   r e t u r n   ( p i p F a c t o r s [ i ] ) ;  
       r e t u r n ( 1 0 0 0 0 ) ;  
  
     }  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |                                                                                                                                     |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 i n t   D o e s S i g n a l C a t c h e d ( s t r i n g   s y m b o l ,   i n t   t y p e ,   d a t e t i m e   f r o m )  
     {  
       i n t   t y p e 2 = - 1 ;  
       i f ( t y p e = = O P _ B U Y )  
             t y p e 2 = O P _ B U Y L I M I T ;  
       i f ( t y p e = = O P _ S E L L )  
             t y p e 2 = O P _ S E L L L I M I T ;  
  
  
  
       i f ( t y p e < 2   | |   t y p e = = - 1 )  
           {  
             f o r ( i n t   i = P o s i t i o n s T o t a l ( ) - 1 ;   i > = 0 ;   i - - )  
                   i f ( P o s i t i o n G e t T i c k e t ( i ) > 0 )  
                         i f ( P o s i t i o n G e t S t r i n g ( P O S I T I O N _ S Y M B O L ) = = s y m b o l   & &   ( t y p e = = - 1   | |   P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T Y P E ) = = t y p e ) )  
                             {  
                               d a t e t i m e     d t = P o s i t i o n G e t I n t e g e r ( P O S I T I O N _ T I M E ) ;  
                               i f ( d t > = f r o m )  
                                     r e t u r n   ( P o s i t i o n G e t T i c k e t ( i ) ) ;  
                             }  
           }  
       i f ( t y p e 2 > = 2   | |   t y p e = = - 1 )  
           {  
             f o r ( i n t   i = O r d e r s T o t a l ( ) - 1 ;   i > = 0 ;   i - - )  
                   i f ( O r d e r G e t T i c k e t ( i ) > 0 )  
                         i f ( O r d e r G e t S t r i n g ( O R D E R _ S Y M B O L ) = = s y m b o l   & &   ( t y p e = = - 1   | |   O r d e r G e t I n t e g e r ( O R D E R _ T Y P E ) = = t y p e 2 ) )  
                             {  
                               d a t e t i m e     d t = O r d e r G e t I n t e g e r ( O R D E R _ T I M E _ S E T U P ) ;  
                               i f ( d t > = f r o m )  
                                     r e t u r n   ( O r d e r G e t T i c k e t ( i ) ) ;  
                             }  
           }  
  
  
  
       i n t   t o t a l = H i s t o r y O r d e r s T o t a l ( ) ;  
       f o r ( i n t   p o s = 0 ;   p o s < t o t a l ;   p o s + + )  
           {  
             i f ( H i s t o r y O r d e r G e t T i c k e t ( p o s ) > 0 )  
                   i f ( H i s t o r y O r d e r G e t S t r i n g ( H i s t o r y O r d e r G e t T i c k e t ( p o s ) , O R D E R _ S Y M B O L ) = = s y m b o l   & &   ( t y p e = = - 1   | |   H i s t o r y O r d e r G e t I n t e g e r ( H i s t o r y O r d e r G e t T i c k e t ( p o s ) , O R D E R _ T Y P E ) = = t y p e 2 ) )  
                       {  
                         d a t e t i m e     d t = H i s t o r y O r d e r G e t I n t e g e r ( H i s t o r y O r d e r G e t T i c k e t ( p o s ) , O R D E R _ T I M E _ S E T U P ) ;  
                         i f ( d t > = f r o m )  
                               r e t u r n   ( H i s t o r y O r d e r G e t T i c k e t ( p o s ) ) ;  
                       }  
           }  
  
       t o t a l = H i s t o r y D e a l s T o t a l ( ) ;  
       f o r ( i n t   p o s = 0 ;   p o s < t o t a l ;   p o s + + )  
           {  
             i f ( H i s t o r y D e a l G e t T i c k e t ( p o s ) < = 0 )  
                   i f ( H i s t o r y D e a l G e t S t r i n g ( H i s t o r y D e a l G e t T i c k e t ( p o s ) , D E A L _ S Y M B O L ) = = s y m b o l   & &   ( t y p e = = - 1   | |   H i s t o r y D e a l G e t I n t e g e r ( H i s t o r y D e a l G e t T i c k e t ( p o s ) , D E A L _ T Y P E ) = = t y p e ) )  
                       {  
                         d a t e t i m e     d t = H i s t o r y D e a l G e t I n t e g e r ( H i s t o r y D e a l G e t T i c k e t ( p o s ) , D E A L _ T I M E ) ;  
                         i f ( d t > = f r o m )  
                               r e t u r n   ( H i s t o r y D e a l G e t T i c k e t ( p o s ) ) ;  
                       }  
           }  
  
       r e t u r n   ( - 1 ) ;  
     }  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |                                                                                                                                     |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 b o o l   G e t F l a g ( s t r i n g   n e w C o m m e n t )  
     {  
  
       i n t   t o t a l = O r d e r s T o t a l ( ) ;  
  
       f o r ( i n t   p o s = 0 ;   p o s < t o t a l ;   p o s + + )  
           {  
             i f ( O r d e r G e t T i c k e t ( p o s ) < = 0 )  
                   c o n t i n u e ;  
  
             i f ( S t r i n g F i n d ( O r d e r G e t S t r i n g ( O R D E R _ C O M M E N T ) , n e w C o m m e n t ) ! = - 1 )  
                   r e t u r n   t r u e ;  
           }  
  
       t o t a l = P o s i t i o n s T o t a l ( ) ;  
       f o r ( i n t   p o s = 0 ;   p o s < t o t a l ;   p o s + + )  
           {  
             i f ( P o s i t i o n G e t T i c k e t ( p o s ) < = 0 )  
                   c o n t i n u e ;  
  
             i f ( S t r i n g F i n d ( P o s i t i o n G e t S t r i n g ( P O S I T I O N _ C O M M E N T ) , n e w C o m m e n t ) ! = - 1 )  
                   r e t u r n   t r u e ;  
           }  
  
       t o t a l = H i s t o r y O r d e r s T o t a l ( ) ;  
       f o r ( i n t   p o s = 0 ;   p o s < t o t a l ;   p o s + + )  
           {  
             i f ( H i s t o r y O r d e r G e t T i c k e t ( p o s ) < = 0 )  
                   c o n t i n u e ;  
  
             i f ( S t r i n g F i n d ( H i s t o r y O r d e r G e t S t r i n g ( H i s t o r y O r d e r G e t T i c k e t ( p o s ) , O R D E R _ C O M M E N T ) , n e w C o m m e n t ) ! = - 1 )  
                   r e t u r n   t r u e ;  
           }  
  
       t o t a l = H i s t o r y D e a l s T o t a l ( ) ;  
       f o r ( i n t   p o s = 0 ;   p o s < t o t a l ;   p o s + + )  
           {  
             i f ( H i s t o r y D e a l G e t T i c k e t ( p o s ) < = 0 )  
                   c o n t i n u e ;  
  
             i f ( S t r i n g F i n d ( H i s t o r y D e a l G e t S t r i n g ( H i s t o r y D e a l G e t T i c k e t ( p o s ) , D E A L _ C O M M E N T ) , n e w C o m m e n t ) ! = - 1 )  
                   r e t u r n   t r u e ;  
           }  
  
       r e t u r n   f a l s e ;  
     }  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 