package ru.job4j.dream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.job4j.dream.model.Candidate;
import ru.job4j.dream.model.Post;
import ru.job4j.dream.store.PsqlStore;
import ru.job4j.dream.store.Store;

import java.io.File;

public class PsqlMain {
    private static final Logger LOG = LoggerFactory.getLogger(PsqlMain.class.getName());

    public static void main(String[] args) {
        try {
            int a = 1;
            a = a / (a - 1);
            System.out.println(a);
        } catch (ArithmeticException e) {
            LOG.error("Exception: " + e.getMessage(), e);
        }

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

        for (File file : new File("c:\\images\\").listFiles()) {
            System.out.println(file.getAbsolutePath());
        }

        System.out.println(PsqlStore.instOf().findAllUsers());
        PsqlStore.instOf().deleteUser("nata@gmail.com");
        System.out.println(PsqlStore.instOf().findAllUsers());
    }
}
