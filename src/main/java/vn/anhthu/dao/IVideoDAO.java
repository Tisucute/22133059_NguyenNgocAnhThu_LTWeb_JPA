package vn.anhthu.dao;

import java.util.List;

import vn.anhthu.entity.Video;

public interface IVideoDAO {
	int count();

    List<Video> findAll(int page, int pageSize);

    List<Video> findByVideoTitle(String title);

    List<Video> findAll();

    Video findById(String videoId);

    void delete(int videoId) throws Exception;

    void update(Video video);

    void insert(Video video);
}
