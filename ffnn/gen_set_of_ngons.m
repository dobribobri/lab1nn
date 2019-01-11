function gen_set_of_ngons(number_of_images, nS, folder, baseFileName, type, speedup)

if strcmp(type,'simplified')
    if strcmp(speedup,'yes')
        parfor k = 1:number_of_images
            img = gen_ngon_image_simplified(nS);
            fullFileName = [folder  baseFileName '-' int2str(k)  '.png'];
            save_image(folder,baseFileName,fullFileName,img.cdata);
            disp([int2str(k) '/' int2str(number_of_images)])
        end %for k
    else
        for k = 1:number_of_images
            img = gen_ngon_image_simplified(nS);
            fullFileName = [folder  baseFileName '-' int2str(k)  '.png'];
            save_image(folder,baseFileName,fullFileName,img.cdata);
            disp([int2str(k) '/' int2str(number_of_images)])
        end %for k
    end %if
else
    if strcmp(speedup,'yes')
        parfor k = 1:number_of_images
            img = gen_ngon_image(nS);
            fullFileName = [folder  baseFileName '-' int2str(k)  '.png'];
            save_image(folder,baseFileName,fullFileName,img.cdata);
            disp([int2str(k) '/' int2str(number_of_images)])
        end %for k
    else
        for k = 1:number_of_images
            img = gen_ngon_image(nS);
            fullFileName = [folder  baseFileName '-' int2str(k)  '.png'];
            save_image(folder,baseFileName,fullFileName,img.cdata);
            disp([int2str(k) '/' int2str(number_of_images)])
        end %for k
    end %if    
end 
    