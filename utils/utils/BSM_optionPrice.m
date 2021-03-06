function results=BSM_optionPrice(S,K,r,T,t,vol)
d1=(log(S./K)+(r+(vol^2)/2)*(T-t))./(vol*sqrt(T-t));
d2=d1-vol*sqrt(T-t);
results.Call=S.*normcdf(d1,0,1)-K.*exp(-r*(T-t)).*normcdf(d2,0,1);
results.Put=K.*exp(-r*(T-t))-S+results.Call;
results.DeltaCall=normcdf(d1,0,1);
results.DeltaPut=normcdf(d1,0,1)-1; 
tmp=normpdf(d1,0,1)./(S*vol*sqrt(T-t));
results.Gamma=tmp;
results.ThetaCall =-r*K*(sqrt(T-t))*normcdf(d2)-0.5*tmp*(S*vol)^2;
results.ThetaPut =-r*K*(sqrt(T-t))*normcdf(-d2)-0.5*tmp*(S*vol)^2;
results.KappaCall=(normcdf(-d2)-1).*exp(-r*(T-t));
results.KappaPut=(normcdf(-d2)).*exp(-r*(T-t));
results.RhoCall=K*(T-t)*normcdf(d2).*exp(-r*(T-t));
results.RhoPut=-K*(T-t)*normcdf(-d2).*exp(-r*(T-t));
results.Vega=K*normcdf(d1)*sqrt(T-t);


