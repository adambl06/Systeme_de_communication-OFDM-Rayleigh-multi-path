
test=1;
M=zeros(1,3);
RESULTAT=M;
Nb_pilotes=24;
%rajouter le script variable globales
while test < 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Bande_disponible=20*10^(6);              %Fournie par le cahier des charges
    Tau_max=100*10^(-9);                       %Fourni par le cahier des charges 
    coef=256 ;     %100                                     % paramètre qui multiplie Tau_max pour connaitre Temps_symbole
    Temps_symbole=coef * Tau_max;         % Choisi comme 100* Tau_max

    Nb_porteuses_max=double(uint32(Temps_symbole*Bande_disponible));  %Donne le nombre de porteuses max que nous disposons

    



    if(Nb_pilotes~=0)
        while mod(Nb_porteuses_max,Nb_pilotes)~=0        %condition pour les pilotes !
            Nb_pilotes=Nb_pilotes+1;
        end
    end

    Nb_porteuses_utiles=double(uint32(Nb_porteuses_max - Nb_pilotes));

    %%%%Paramètres du bloc de BERNOUILLI

    Sample_Tps= Temps_symbole /(2*Nb_porteuses_utiles) ;
    Sample_rt =double(uint32(Nb_porteuses_utiles)*2);  %unit16 pour convertir en integer 

    la_puissance=0;
    Puissance_de_2=0;

    while  Nb_porteuses_max > Puissance_de_2
        Puissance_de_2=2^la_puissance;
        la_puissance=la_puissance+1;
    end


    Nb_de_zeros = double( uint32(Puissance_de_2 - Nb_porteuses_max));
    Taille_du_prefixe_cyclique= ceil(Puissance_de_2/coef) + 10; 
    Temps_echantillonnage=Temps_symbole /(Taille_du_prefixe_cyclique+Puissance_de_2);
    Vecteur_delay=[0*Temps_echantillonnage, 1*Temps_echantillonnage, 2*Temps_echantillonnage];
    Vecteur_de_Gain= [0, -3, -6] ;
    Output_buffer=Taille_du_prefixe_cyclique+Puissance_de_2;
    RCV_delay_ERC=Nb_porteuses_utiles*2;

    SNR_value=10;
    
    
    
    
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    sim('PROJET_PSC_MAX');
    PSG=ans.BER_RESULT;
    r=size(PSG,1);
    A=PSG(r,:);
    RESULTAT=[RESULTAT ; A];
    
    Nb_pilotes=Nb_pilotes+1;
    
    test=test+1;
end