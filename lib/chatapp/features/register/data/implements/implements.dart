
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class RegisterRepositoryImp implements RegisterRepository{

        final RegisterRemoteDataSource remoteDataSource;
        RegisterRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    