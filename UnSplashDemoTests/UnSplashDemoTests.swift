//
//  UnSplashDemoTests.swift
//  UnSplashDemoTests
//
//  Created by Manmeet Swach on 2022-10-27.
//

import XCTest

@testable import UnSplashDemo

final class UnSplashDemoTests: XCTestCase {
    var urlSession: URLSession!

    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }
    
    //In this test we are testing parsing of the data and the network call together. In real world setting it should be done seperately for example.
    func testNetworkCall() throws {
        let viewModel = ViewModel(urlSession: urlSession)
        let mockData = string.data(using: .utf8)!

        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }
        let expectation = XCTestExpectation(description: "response")
        
        viewModel.fetchPicturesOfCat(completion: { picturesOfCat in
            XCTAssertEqual(picturesOfCat.total, 10000)
            XCTAssertEqual(picturesOfCat.results.first?.id, "gKXKBY-C-Dk")
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
    
    
    let string =
    """
{
    "total": 10000,
    "total_pages": 1000,
    "results":
    [
        {
            "id": "gKXKBY-C-Dk",
            "created_at": "2018-01-02T10:20:47Z",
            "updated_at": "2022-10-26T07:02:41Z",
            "promoted_at": null,
            "width": 5026,
            "height": 3458,
            "color": "#598c73",
            "blur_hash": "LDCtq6Me0_kp3mof%MofUwkp,cRP",
            "description": "Gipsy the Cat was sitting on a bookshelf one afternoon and just stared right at me, kinda saying: “Will you take a picture already?”",
            "alt_description": "black and white cat lying on brown bamboo chair inside room",
            "urls": {
                "raw": "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwxfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4&ixlib=rb-4.0.3",
                "full": "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwxfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4&ixlib=rb-4.0.3&q=80",
                "regular": "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwxfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4&ixlib=rb-4.0.3&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwxfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4&ixlib=rb-4.0.3&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwxfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4&ixlib=rb-4.0.3&q=80&w=200",
                "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1514888286974-6c03e2ca1dba"
            },
            "links": {
                "self": "https://api.unsplash.com/photos/gKXKBY-C-Dk",
                "html": "https://unsplash.com/photos/gKXKBY-C-Dk",
                "download": "https://unsplash.com/photos/gKXKBY-C-Dk/download?ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwxfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4",
                "download_location": "https://api.unsplash.com/photos/gKXKBY-C-Dk/download?ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwxfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4"
            },
            "likes": 1153,
            "liked_by_user": false,
            "current_user_collections": [],
            "sponsorship": null,
            "topic_submissions": {},
            "user": {
                "id": "wBu1hC4QlL0",
                "updated_at": "2022-10-06T16:43:58Z",
                "username": "madhatterzone",
                "name": "Manja Vitolic",
                "first_name": "Manja",
                "last_name": "Vitolic",
                "twitter_username": null,
                "portfolio_url": "https://www.instagram.com/makawee_photography/?hl=en",
                "bio": "https://www.instagram.com/makawee_photography/",
                "location": "Wiesbaden, Germany",
                "links": {
                    "self": "https://api.unsplash.com/users/madhatterzone",
                    "html": "https://unsplash.com/@madhatterzone",
                    "photos": "https://api.unsplash.com/users/madhatterzone/photos",
                    "likes": "https://api.unsplash.com/users/madhatterzone/likes",
                    "portfolio": "https://api.unsplash.com/users/madhatterzone/portfolio",
                    "following": "https://api.unsplash.com/users/madhatterzone/following",
                    "followers": "https://api.unsplash.com/users/madhatterzone/followers"
                },
                "profile_image": {
                    "small": "https://images.unsplash.com/profile-fb-1514888261-0e72294039e0.jpg?ixlib=rb-1.2.1&crop=faces&fit=crop&w=32&h=32",
                    "medium": "https://images.unsplash.com/profile-fb-1514888261-0e72294039e0.jpg?ixlib=rb-1.2.1&crop=faces&fit=crop&w=64&h=64",
                    "large": "https://images.unsplash.com/profile-fb-1514888261-0e72294039e0.jpg?ixlib=rb-1.2.1&crop=faces&fit=crop&w=128&h=128"
                },
                "instagram_username": "makawee_photography",
                "total_collections": 0,
                "total_likes": 10,
                "total_photos": 65,
                "accepted_tos": true,
                "for_hire": true,
                "social": {
                    "instagram_username": "makawee_photography",
                    "portfolio_url": "https://www.instagram.com/makawee_photography/?hl=en",
                    "twitter_username": null,
                    "paypal_email": null
                }
            },
            "tags": [
                {
                    "type": "landing_page",
                    "title": "cat",
                    "source": {
                        "ancestry": {
                            "type": {
                                "slug": "images",
                                "pretty_slug": "Images"
                            },
                            "category": {
                                "slug": "animals",
                                "pretty_slug": "Animals"
                            },
                            "subcategory": {
                                "slug": "cat",
                                "pretty_slug": "Cat"
                            }
                        },
                        "title": "Cat images & pictures",
                        "subtitle": "Download free cat images",
                        "description": "9 lives isn't enough to capture the amazing-ness of cats. You need high-quality, professionally photographed images to do that. Unsplash's collection of cat images capture the wonder of the kitty in high-definition, and you can use these images however you wish for free.",
                        "meta_title": "20+ Cat Pictures & Images [HD] | Download Free Images & Stock Photos on Unsplash",
                        "meta_description": "Choose from hundreds of free cat pictures. Download HD cat photos for free on Unsplash.",
                        "cover_photo": {
                            "id": "_SMNO4cN9vs",
                            "created_at": "2018-12-30T17:17:38Z",
                            "updated_at": "2022-08-04T18:27:03Z",
                            "promoted_at": "2019-01-01T10:23:58Z",
                            "width": 4000,
                            "height": 4000,
                            "color": "#0c0c26",
                            "blur_hash": "L012.;oL4=WBt6j@Rlay4;ay^iof",
                            "description": "Glow in the Dark",
                            "alt_description": "yellow eyes",
                            "urls": {
                                "raw": "https://images.unsplash.com/photo-1546190255-451a91afc548?ixlib=rb-1.2.1",
                                "full": "https://images.unsplash.com/photo-1546190255-451a91afc548?ixlib=rb-1.2.1&q=80&cs=tinysrgb&fm=jpg&crop=entropy",
                                "regular": "https://images.unsplash.com/photo-1546190255-451a91afc548?ixlib=rb-1.2.1&w=1080&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb",
                                "small": "https://images.unsplash.com/photo-1546190255-451a91afc548?ixlib=rb-1.2.1&w=400&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb",
                                "thumb": "https://images.unsplash.com/photo-1546190255-451a91afc548?ixlib=rb-1.2.1&w=200&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb",
                                "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1546190255-451a91afc548"
                            },
                            "links": {
                                "self": "https://api.unsplash.com/photos/_SMNO4cN9vs",
                                "html": "https://unsplash.com/photos/_SMNO4cN9vs",
                                "download": "https://unsplash.com/photos/_SMNO4cN9vs/download",
                                "download_location": "https://api.unsplash.com/photos/_SMNO4cN9vs/download"
                            },
                            "likes": 513,
                            "liked_by_user": false,
                            "current_user_collections": [],
                            "sponsorship": null,
                            "topic_submissions": {
                                "animals": {
                                    "status": "approved",
                                    "approved_on": "2020-04-06T14:20:17Z"
                                }
                            },
                            "premium": false,
                            "user": {
                                "id": "KlbPlQFM3j4",
                                "updated_at": "2021-06-29T13:48:33Z",
                                "username": "unlesbar_1608112_sink",
                                "name": "Stephan Henning",
                                "first_name": "Stephan",
                                "last_name": "Henning",
                                "twitter_username": null,
                                "portfolio_url": null,
                                "bio": null,
                                "location": "Germany",
                                "links": {
                                    "self": "https://api.unsplash.com/users/unlesbar_1608112_sink",
                                    "html": "https://unsplash.com/@unlesbar_1608112_sink",
                                    "photos": "https://api.unsplash.com/users/unlesbar_1608112_sink/photos",
                                    "likes": "https://api.unsplash.com/users/unlesbar_1608112_sink/likes",
                                    "portfolio": "https://api.unsplash.com/users/unlesbar_1608112_sink/portfolio",
                                    "following": "https://api.unsplash.com/users/unlesbar_1608112_sink/following",
                                    "followers": "https://api.unsplash.com/users/unlesbar_1608112_sink/followers"
                                },
                                "profile_image": {
                                    "small": "https://images.unsplash.com/profile-1531167540173-a920494357e7?ixlib=rb-1.2.1&crop=faces&fit=crop&w=32&h=32",
                                    "medium": "https://images.unsplash.com/profile-1531167540173-a920494357e7?ixlib=rb-1.2.1&crop=faces&fit=crop&w=64&h=64",
                                    "large": "https://images.unsplash.com/profile-1531167540173-a920494357e7?ixlib=rb-1.2.1&crop=faces&fit=crop&w=128&h=128"
                                },
                                "instagram_username": null,
                                "total_collections": 3,
                                "total_likes": 67,
                                "total_photos": 0,
                                "accepted_tos": true,
                                "for_hire": false,
                                "social": {
                                    "instagram_username": null,
                                    "portfolio_url": null,
                                    "twitter_username": null,
                                    "paypal_email": null
                                }
                            }
                        }
                    }
                }
            ]
        },
        {
            "id": "75715CVEJhI",
            "created_at": "2019-11-16T00:53:02Z",
            "updated_at": "2022-10-26T14:12:29Z",
            "promoted_at": "2019-11-16T16:17:51Z",
            "width": 3961,
            "height": 5546,
            "color": "#8ca6a6",
            "blur_hash": "LPD+;@x^I[S%*0tRjYW=FzV@r;sl",
            "description": "One of my cats, Vladimir. He is from Russia! He has an instagram if you'd like to see more of him: @Vladimir_Purtin",
            "alt_description": "selective focus photography of orange and white cat on brown table",
            "urls": {
                "raw": "https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwyfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4&ixlib=rb-4.0.3",
                "full": "https://images.unsplash.com/photo-1573865526739-10659fec78a5?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwyfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4&ixlib=rb-4.0.3&q=80",
                "regular": "https://images.unsplash.com/photo-1573865526739-10659fec78a5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwyfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4&ixlib=rb-4.0.3&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1573865526739-10659fec78a5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwyfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4&ixlib=rb-4.0.3&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1573865526739-10659fec78a5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwyfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4&ixlib=rb-4.0.3&q=80&w=200",
                "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1573865526739-10659fec78a5"
            },
            "links": {
                "self": "https://api.unsplash.com/photos/75715CVEJhI",
                "html": "https://unsplash.com/photos/75715CVEJhI",
                "download": "https://unsplash.com/photos/75715CVEJhI/download?ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwyfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4",
                "download_location": "https://api.unsplash.com/photos/75715CVEJhI/download?ixid=MnwyMzQ1OTF8MHwxfHNlYXJjaHwyfHxjYXR8ZW58MHx8fHwxNjY2ODIxODA4"
            },
            "likes": 1441,
            "liked_by_user": false,
            "current_user_collections": [],
            "sponsorship": null,
            "topic_submissions": {
                "wallpapers": {
                    "status": "rejected"
                },
                "nature": {
                    "status": "rejected"
                },
                "animals": {
                    "status": "approved",
                    "approved_on": "2020-04-06T14:20:17Z"
                }
            },
            "user": {
                "id": "BphsdTed9SM",
                "updated_at": "2022-10-26T10:14:04Z",
                "username": "sadmax",
                "name": "Amber Kipp",
                "first_name": "Amber",
                "last_name": "Kipp",
                "twitter_username": "Kipptacular",
                "portfolio_url": "http://kipp.gallery",
                "bio": "Born & raised in Key West, FL but currently residing in Michigan.",
                "location": "Grand Rapids, MI",
                "links": {
                    "self": "https://api.unsplash.com/users/sadmax",
                    "html": "https://unsplash.com/@sadmax",
                    "photos": "https://api.unsplash.com/users/sadmax/photos",
                    "likes": "https://api.unsplash.com/users/sadmax/likes",
                    "portfolio": "https://api.unsplash.com/users/sadmax/portfolio",
                    "following": "https://api.unsplash.com/users/sadmax/following",
                    "followers": "https://api.unsplash.com/users/sadmax/followers"
                },
                "profile_image": {
                    "small": "https://images.unsplash.com/profile-1622042628346-724d32229f67image?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32",
                    "medium": "https://images.unsplash.com/profile-1622042628346-724d32229f67image?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64",
                    "large": "https://images.unsplash.com/profile-1622042628346-724d32229f67image?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128"
                },
                "instagram_username": "kippster_",
                "total_collections": 14,
                "total_likes": 867,
                "total_photos": 122,
                "accepted_tos": true,
                "for_hire": true,
                "social": {
                    "instagram_username": "kippster_",
                    "portfolio_url": "http://kipp.gallery",
                    "twitter_username": "Kipptacular",
                    "paypal_email": null
                }
            },
            "tags": [
                {
                    "type": "landing_page",
                    "title": "cat",
                    "source": {
                        "ancestry": {
                            "type": {
                                "slug": "images",
                                "pretty_slug": "Images"
                            },
                            "category": {
                                "slug": "animals",
                                "pretty_slug": "Animals"
                            },
                            "subcategory": {
                                "slug": "cat",
                                "pretty_slug": "Cat"
                            }
                        },
                        "title": "Cat images & pictures",
                        "subtitle": "Download free cat images",
                        "description": "9 lives isn't enough to capture the amazing-ness of cats. You need high-quality, professionally photographed images to do that. Unsplash's collection of cat images capture the wonder of the kitty in high-definition, and you can use these images however you wish for free.",
                        "meta_title": "20+ Cat Pictures & Images [HD] | Download Free Images & Stock Photos on Unsplash",
                        "meta_description": "Choose from hundreds of free cat pictures. Download HD cat photos for free on Unsplash.",
                        "cover_photo": {
                            "id": "_SMNO4cN9vs",
                            "created_at": "2018-12-30T17:17:38Z",
                            "updated_at": "2022-08-04T18:27:03Z",
                            "promoted_at": "2019-01-01T10:23:58Z",
                            "width": 4000,
                            "height": 4000,
                            "color": "#0c0c26",
                            "blur_hash": "L012.;oL4=WBt6j@Rlay4;ay^iof",
                            "description": "Glow in the Dark",
                            "alt_description": "yellow eyes",
                            "urls": {
                                "raw": "https://images.unsplash.com/photo-1546190255-451a91afc548?ixlib=rb-1.2.1",
                                "full": "https://images.unsplash.com/photo-1546190255-451a91afc548?ixlib=rb-1.2.1&q=80&cs=tinysrgb&fm=jpg&crop=entropy",
                                "regular": "https://images.unsplash.com/photo-1546190255-451a91afc548?ixlib=rb-1.2.1&w=1080&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb",
                                "small": "https://images.unsplash.com/photo-1546190255-451a91afc548?ixlib=rb-1.2.1&w=400&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb",
                                "thumb": "https://images.unsplash.com/photo-1546190255-451a91afc548?ixlib=rb-1.2.1&w=200&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb",
                                "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1546190255-451a91afc548"
                            },
                            "links": {
                                "self": "https://api.unsplash.com/photos/_SMNO4cN9vs",
                                "html": "https://unsplash.com/photos/_SMNO4cN9vs",
                                "download": "https://unsplash.com/photos/_SMNO4cN9vs/download",
                                "download_location": "https://api.unsplash.com/photos/_SMNO4cN9vs/download"
                            },
                            "likes": 513,
                            "liked_by_user": false,
                            "current_user_collections": [],
                            "sponsorship": null,
                            "topic_submissions": {
                                "animals": {
                                    "status": "approved",
                                    "approved_on": "2020-04-06T14:20:17Z"
                                }
                            },
                            "premium": false,
                            "user": {
                                "id": "KlbPlQFM3j4",
                                "updated_at": "2021-06-29T13:48:33Z",
                                "username": "unlesbar_1608112_sink",
                                "name": "Stephan Henning",
                                "first_name": "Stephan",
                                "last_name": "Henning",
                                "twitter_username": null,
                                "portfolio_url": null,
                                "bio": null,
                                "location": "Germany",
                                "links": {
                                    "self": "https://api.unsplash.com/users/unlesbar_1608112_sink",
                                    "html": "https://unsplash.com/@unlesbar_1608112_sink",
                                    "photos": "https://api.unsplash.com/users/unlesbar_1608112_sink/photos",
                                    "likes": "https://api.unsplash.com/users/unlesbar_1608112_sink/likes",
                                    "portfolio": "https://api.unsplash.com/users/unlesbar_1608112_sink/portfolio",
                                    "following": "https://api.unsplash.com/users/unlesbar_1608112_sink/following",
                                    "followers": "https://api.unsplash.com/users/unlesbar_1608112_sink/followers"
                                },
                                "profile_image": {
                                    "small": "https://images.unsplash.com/profile-1531167540173-a920494357e7?ixlib=rb-1.2.1&crop=faces&fit=crop&w=32&h=32",
                                    "medium": "https://images.unsplash.com/profile-1531167540173-a920494357e7?ixlib=rb-1.2.1&crop=faces&fit=crop&w=64&h=64",
                                    "large": "https://images.unsplash.com/profile-1531167540173-a920494357e7?ixlib=rb-1.2.1&crop=faces&fit=crop&w=128&h=128"
                                },
                                "instagram_username": null,
                                "total_collections": 3,
                                "total_likes": 67,
                                "total_photos": 0,
                                "accepted_tos": true,
                                "for_hire": false,
                                "social": {
                                    "instagram_username": null,
                                    "portfolio_url": null,
                                    "twitter_username": null,
                                    "paypal_email": null
                                }
                            }
                        }
                    }
                }
            ]
        }
    ]
}
"""
}
