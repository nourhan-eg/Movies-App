import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/profile/presentation/bloc/wishlist_bloc/wishlist_event.dart';
import 'package:movies/features/main_screen/profile/presentation/bloc/wishlist_bloc/wishlist_state.dart';

import '../../../domain/use_cases/wishlist_usecases/add_to_wishlist_use_case.dart';
import '../../../domain/use_cases/wishlist_usecases/get_wishlist_use_case.dart';
import '../../../domain/use_cases/wishlist_usecases/remove_from_wishlist_use_case.dart';

@injectable
class WishlistBloc  extends Bloc<WishlistEvent, WishlistState>{
  final GetWishlistUseCase getWishlistUseCase;
  final AddToWishlistUseCase addToWishlistUseCase;
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;
  WishlistBloc({required this.getWishlistUseCase, required this.addToWishlistUseCase, required this.removeFromWishlistUseCase}) : super(WishlistInitial()){
    on<LoadWishlist>(_loadWishlist);
    on<AddToWishlistRequest>(_addToWishlist);
    on<RemoveFromWishlistRequest>(_removeFromWishlist);

  }
  Future<void> _loadWishlist(LoadWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try{
      final movies = await getWishlistUseCase();
      emit(WishlistLoaded(movies));
    }catch(e){
      emit(WishlistError('Failed to load wishlist'));
    }

    }
    Future<void> _addToWishlist(AddToWishlistRequest event, Emitter<WishlistState> emit) async {
    try{
      await addToWishlistUseCase(event.movie);
      emit(WishlistLoaded(await getWishlistUseCase()));}
    catch(e){
      emit(WishlistError('Failed to add to wishlist'));
      add(LoadWishlist());
    }
    }

    Future<void> _removeFromWishlist(RemoveFromWishlistRequest event, Emitter<WishlistState> emit) async {
    try{
      await removeFromWishlistUseCase(event.movie);
      emit(WishlistLoaded(await getWishlistUseCase()));}
    catch(e){
      emit(WishlistError('Failed to remove from wishlist'));
      add(LoadWishlist());
    }
    }



}