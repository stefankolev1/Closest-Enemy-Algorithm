%tests
%[0 0 0 0; 1 0 0 0; 0 0 0 2; 0 0 0 2]
%[0 0 0; 1 0 0; 2 0 0]
A = input('Enter matrix');
player = [];
enemy = [];
distance = 0;
row = 0;
rowLength = 0;
board = length(A);
disp(A);
%%
%Locating the pieces%

%iterate over the length of the board stored in width
for i = 1:board
    %define each row depending on the loop
    row = A(i,:);
    %determine length of each row
    rowLength = length(row);
    for j = 1:rowLength
        %look for the player's starting pos
        %if the player (1) is found then store in the player's index
        %&& store the index of the row on the board into player array
        if row(j) == 1
            player = [player,j];
            player = [i,player];
            
            %look for every enemy (2) on the board
            %if the enemy is found then store the enemy's index
            %&& the index of the row on the board into the enemy array
        elseif row(j) == 2
            enemy = [i,enemy];
            enemy = [enemy,j];
        end
    end
end

%%
%Calculating the distance%
enemyLength = length(enemy);

%iterate over the length of the enemy array
for i = 1:2:enemyLength
    %declare a counter
    newDistance = 0;
    newVertDistance = 0;
    
    %check if the nearest enemy is on the same row
    %use abs() function to return a absolute int
    %if the player's location minus the enemy's loc
    %is less than the row's length / 2 then adjust the newDistance to that
    %value
    if abs(player(1) - enemy(i) < rowLength / 2)
        newDistance = abs(player(1) - enemy(i));
    else
        %otherwise adjust the newDistance to rowLength - the player's
        %location of the enemy's location
        newDistance = rowLength - abs(player(1) - enemy(i));
    end
        %check for distance between the player and enemy up and down the board
    if abs(player(2)- enemy(i+1) < board/2)
        %calc the difference between the player location and the enemy's
        %add it to the overall count of the distance from above
        newVertDistance = abs(player(2) - enemy(i+1));
        i = i+1;
    else
        newVertDistance = (board - abs(player(1) - enemy(i)));
        i = i+1;
    end
    %if the newDistance is less than the overall distance return it
    %otherwise set the distance equal to the shortest travel
    
    if newVertDistance ~= 0 && newVertDistance < newDistance
        newDistance = newVertDistance;
    end
    if distance == 0 || newDistance < distance
        distance = newDistance;
    end
end
fprintf('The shortest distance to the enemy is:')
disp(distance);
