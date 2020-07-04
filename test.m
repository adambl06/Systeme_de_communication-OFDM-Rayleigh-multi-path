function y = test(Xu, Nb_pilotes, Nb_porteuses_utiles)


RES=cell(1,Nb_pilotes);
FINAL=cell(1);
step=Nb_porteuses_utiles/Nb_pilotes;
start=1;
stop=step;
for i=1:Nb_pilotes
    RES{1,i}=1;
end

for k=1:Nb_pilotes
    for l=start:stop
        RES{1,k}=[RES{1,k} Xu(l)];
    end
    start=start+step;
    stop=stop+step;
end

for a=1:Nb_pilotes
    FINAL{1}=[FINAL{1} RES{1,a}];
end



y = FINAL{1};

function y = INSERTION_PILOTES(Xu, Nb_pilotes, Nb_porteuses_utiles, Nb_porteuses_max)

M=zeros(Nb_pilotes,(Nb_porteuses_max/Nb_pilotes));
step=Nb_porteuses_utiles/Nb_pilotes;
start=1;
stop=step;
for i=1:Nb_pilotes    
    M(i,1)=complex(1);
end

for k=1:Nb_pilotes
    C=2;
    for l=start:stop        
        M(k,C)=Xu(l);
        C=C+1;
    end
    start=start+step;
    stop=stop+step;
end

RES=M';
RES2=RES(:);



y = RES2;