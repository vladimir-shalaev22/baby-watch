var gulp, sass, browserSync, concat, uglify, cssnano, rename, autoprefixer;

/* Загружаем все необходимые модули */
gulp = require('gulp');
sass = require('gulp-sass');
browserSync = require('browser-sync');
concat = require('gulp-concat');
cssnano = require('gulp-cssnano');
coffee = require('gulp-coffee');
rename = require('gulp-rename');
autoprefixer = require('gulp-autoprefixer');

/* Таск для компиляции таблиц стилей */
gulp.task('sass', function(){
	return gulp.src('src/sass/*.sass')
		.pipe(sass())
		.pipe(autoprefixer(['last 15 versions', '> 1%', 'ie 8', 'ie 7'], { cascade: true }))
    .pipe(cssnano())
		.pipe(gulp.dest('public/css'))
		.pipe(browserSync.reload({stream: true}))
});

/* Запуск сервера browserSync */
gulp.task('browser-sync', function() {
	browserSync({
		server: {
			baseDir: 'public'
		}
	});
});

gulp.task('scripts', function() {
	return gulp.src(['src/coffee/*.coffee'])
    .pipe(coffee())
		.pipe(concat('main.min.js'))
		.pipe(gulp.dest('public/js'));
});

gulp.task('watch', ['browser-sync', 'sass', 'scripts'], function() {
	gulp.watch('src/sass/**/*.sass', ['sass']);
	gulp.watch('public/*.html', browserSync.reload);
	gulp.watch('src/coffee/**/*.coffee', browserSync.reload);
});

gulp.task('default', ['watch']);
