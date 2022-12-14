% Two steels are being considered for the manufacture of as-forged 
% connecting rods subjected to bending loads. One is AISI 4340 Cr-Mo-Ni 
% steel capable of being heat-treated to a tensile strength of 260 kpsi. 
% The other is a plain carbon steel AISI 1040 with an attainable Sut of 
% 113 kpsi. Each rod is to have a size giving an equivalent diameter de of 
% 1.27 in. Determine the endurance limit for each material. Is there any 
% advantage of using the alloy steel for this fatigue application?

Sut_AISI_4340 = 260;
Sut_AISI_1040 = 113;

d_e = 1.27;

% Determine size factors
% de = 1.27, therefore:
k_b = 0.879*d_e^-0.107;