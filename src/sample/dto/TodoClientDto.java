/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package sample.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * DTO used to store multiple tweets for
 * client side operations.
 * @author Peter Guisadio
 * @version 0.01
 * Version History
 * 
 */
public class TodoClientDto {

    /**
     * List of errors.
     */
    private List<String> errorList = new ArrayList<String>();

    /**
     * List of tweets.
     */
    private List<TodoDto> tweetList = new ArrayList<TodoDto>();

    /**
     * Retrieve errorList.
     * @return the errorList
     */
    public List<String> getErrorList() {
        return errorList;
    }

    /**
     * Set errorList.
     * @param errorList the errorList to set
     */
    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }

    /**
     * Retrieve tweetList.
     * @return the tweetList
     */
    public List<TodoDto> getTweetList() {
        return tweetList;
    }

    /**
     * Set tweetList.
     * @param tweetList the tweetList to set
     */
    public void setTweetList(List<TodoDto> tweetList) {
        this.tweetList = tweetList;
    }

}
