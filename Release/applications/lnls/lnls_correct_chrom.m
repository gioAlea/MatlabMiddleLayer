function ring = lnls_correct_chrom(ring, chrom, fams, max_iter, tolerancia)


if ~exist('chrom', 'var')
    chrom = [0,0];
end

if ~exist('fams', 'var')
    fams = {'sda1', 'sda2', 'sda3', 'sfa1', 'sfa2', ...
        'sdb1', 'sdb2', 'sdb3', 'sfb1', 'sfb2', ...
        'sdp1', 'sdp2', 'sdp3', 'sfp1', 'sfp2', ...
        };
end

if ~exist('max_iter', 'var')
    max_iter = 10;
end

if ~exist('tolerancia', 'var')
    tolerancia = 1e-3;
end

indS = cell(length(fams));
dchrom = zeros(length(fams),2);
sumDeltaS = zeros(length(fams),1);

for j=1:length(fams)
    indS{j} = findcells(ring,'FamName',fams{j});
end

for count=1:max_iter
    
    for j=1:length(fams)
        dchrom(j,:) = lnls_calc_dchrom(ring, indS{j});
    end
    
    last_chrom = lnls_calc_chrom(ring);
    
    if(norm(chrom-last_chrom) < tolerancia)
        break
    end

%   Using Lagrange-multipliers method. Lagrange multiplayers are given by
%   the last two elements of DeltaS.

%     A = [eye(length(fams)),dchrom;dchrom',zeros(2)];
%     B = [zeros(length(fams),1);chrom'-last_chrom']; % optimize partial
%     norm
%     %B = [-sumDeltaS;chrom'-last_chrom']; % optimize total norm
%     DeltaS = (A\B);
%     sumDeltaS = sumDeltaS + DeltaS(1:length(fams));

    [U,S,V] = svd(dchrom','econ');
    B = (chrom'-last_chrom');
    
    DeltaS = V*(S\U')*B;
%    DeltaS = V*inv(S)*[1,0;0,0]*U'*B

    for j=1:length(fams)
        strS = getcellstruct(ring,'PolynomB',indS{j},1,3) + DeltaS(j);
        ring = setcellstruct(ring,'PolynomB',indS{j},strS,1,3);
    end
end





function dchrom = lnls_calc_dchrom(ring, ind)

d = 1e-4;

S = getcellstruct(ring,'PolynomB',ind,1,3);

ring = setcellstruct(ring,'PolynomB',ind,S-d,1,3);
chrom1 = lnls_calc_chrom(ring);

ring = setcellstruct(ring,'PolynomB',ind,S+d,1,3);
chrom2 = lnls_calc_chrom(ring);

dchrom = (chrom2 - chrom1)/(2*d);

