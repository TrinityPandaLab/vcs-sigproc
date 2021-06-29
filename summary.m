function M = summary(vec0, vec1, vec2)
    Mat = [vec0, vec1 vec2];
    M = [mean(Mat)',std(Mat)', median(Mat)'];
end