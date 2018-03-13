function [ newData, newLabel ] = reformulateDataset( data, label, problemIndex )
%REFORMULATEDATASET Translates a loaded dataset for the different problems.
%   It is assumed, that the loaded dataset is anotated according to problem
%   0. Using this function the problem can be translated to the problem 1
%   to 4.

newLabel = label;
newData = data;


if ( problemIndex == 0 )
    % Default 9 class problem
    % 1 - Ester S170
    % 2 - Ester S770
    % 3 - Ester S1570
    % 4 - Ester P1570
    % 5 - Mannitol
    % 6 - Sorbitol
    % 7 - Glucose
    % 8 - Galactose
    % 9 - Fructose
    
    % This is the default configuration of the dataset, no changes to be
    % made.    
    
%     warning( 'Data in dataset files is already label according to problem 0. No need for data translation here.' );
    
elseif ( problemIndex == 1 )
    % Create three class problem:
    % 1 - Ester     ( S170, S770, S1570, P1570 )
    % 2 - C6H14O6   ( Sorbitol, Mannitol )
    % 3 - C6H12O6   ( Glucose, Galactose, Fructose )
    
    % Ester
    newLabel( label == 1 ) = 1;
    newLabel( label == 2 ) = 1;
    newLabel( label == 3 ) = 1;
    newLabel( label == 4 ) = 1;
    % C6H12O6
    newLabel( label == 5 ) = 2;
    newLabel( label == 6 ) = 2;
    % C6H14O6
    newLabel( label == 7 ) = 3;
    newLabel( label == 8 ) = 3;
    newLabel( label == 9 ) = 3;
    
    
elseif ( problemIndex == 2 )
    % Only Ester
    % 1 - Ester S170
    % 2 - Ester S770
    % 3 - Ester S1570
    % 4 - Ester P1570    
    newData = data( label == 1 | label == 2 | label == 3 | label == 4, : );
    newLabel = label( label == 1 | label == 2 | label == 3 | label == 4 );
    
elseif ( problemIndex == 3 )
    % Only C6H12O6
    % 1 - Mannitol
    % 2 - Sorbitol
    newData = data( label == 5 | label == 6, : );
    newLabel = label( label == 5 | label == 6 );
    newLabel( newLabel == 5 ) = 1;
    newLabel( newLabel == 6 ) = 2;
    
elseif ( problemIndex == 4 )
    % Only C6H14O6
    % 1 - Glucose
    % 2 - Galactose
    % 3 - Fructose
    newData = data( label == 7 | label == 8 | label == 9, : );
    newLabel = label( label == 7 | label == 8 | label == 9 );
    newLabel( newLabel == 7 ) = 1;
    newLabel( newLabel == 8 ) = 2;
    newLabel( newLabel == 9 ) = 3;    
    
else
    warning( [ 'Problem with number ' num2str( problemIndex ) ' is not specified. Returning data unmodified.' ] );
end;

end

