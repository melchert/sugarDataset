function [ spectra, labels, wavelengths ] = loadDataset( filename )
%LOADDATASET Load a dataset from the sugar dataset

if ( nargin < 1 || isempty( filename ) || ~ischar( filename ) )
    error( 'Parameter is not a valid filename' );
end;

if ( exist( filename, 'file' ) ~= 2   )
    error( [ 'File "' filename '" does not exist.' ] );
end;


% load data from file
temp = load( filename );

% first line is wavelength vector
wavelengths = temp( 1, : );
% very first value is dropped, since the wavelength vector has no class
wavelengths = wavelengths( 2:end );

% drop first line from data
temp = temp( 2:end, : );

% labels stored in first column
labels = temp( :, 1 );
% spectral information is stored in the following columns
spectra = temp( :, 2:end );


end

