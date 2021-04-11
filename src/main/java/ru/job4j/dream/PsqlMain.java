package ru.job4j.dream;

import ru.job4j.dream.model.Candidate;
import ru.job4j.dream.model.Post;
import ru.job4j.dream.store.PsqlStore;
import ru.job4j.dream.store.Store;

public class PsqlMain {
    public static void main(String[] args) {
        Store store = PsqlStore.instOf();
        store.save(new Post(0, "Java Job"));
        Post post1 = null;
        for (Post post : store.findAllPosts()) {
            post1 = post;
            System.out.println(post.getId() + " " + post.getName());
        }

        Candidate candidate1 = null;
        store.save(new Candidate(0, "Jora"));
        for (Candidate candidate : store.findAllCandidates()) {
            candidate1 = candidate;
            System.out.println(candidate.getId() + " " + candidate.getName());
        }

        System.out.println(post1.getId() + " " + post1.getName());
        System.out.println(candidate1.getId() + " " + candidate1.getName());
    }
}
