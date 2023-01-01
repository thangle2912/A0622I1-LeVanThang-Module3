package service;


import repository.FacilityRepository;
import repository.IFacilityRepository;

public class FacilityService implements IFacilityService {
    private FacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public boolean delete(int id) {
        return facilityRepository.delete(id);
    }
}
