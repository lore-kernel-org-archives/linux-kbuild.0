Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:27650 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752059AbeDGD1r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Apr 2018 23:27:47 -0400
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com [209.85.217.179]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w373RUik001018
        for <linux-kbuild@vger.kernel.org>; Sat, 7 Apr 2018 12:27:31 +0900
Received: by mail-ua0-f179.google.com with SMTP id r16so1887239uak.11
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Apr 2018 20:27:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180406132330.exxlbxbnleafndwi@redhat.com>
References: <20180404195625.24657-1-dzickus@redhat.com> <CAK7LNAQ78HHOz1fu2==_nZDzUTuxRZLHuFu6yu1C354xH8Y8fA@mail.gmail.com>
 <20180405150329.6ax5pdmwiurx3kg7@redhat.com> <CAK7LNAQwaWKbw8hCwH3V4g9fVTZfuj_VWU0juwnE6sg6QvyJ8g@mail.gmail.com>
 <20180406132330.exxlbxbnleafndwi@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 7 Apr 2018 12:26:49 +0900
Message-ID: <CAK7LNASWpPQt-4-E=YNok+xTADZXa3JE53C_a32BMQe5Qjx+NA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: add support for new option 'listnewdefconfig'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Don Zickus <dzickus@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-04-06 22:23 GMT+09:00 Don Zickus <dzickus@redhat.com>:
> On Fri, Apr 06, 2018 at 04:29:53PM +0900, Masahiro Yamada wrote:
>> 2018-04-06 0:03 GMT+09:00 Don Zickus <dzickus@redhat.com>:
>> > On Thu, Apr 05, 2018 at 11:29:11AM +0900, Masahiro Yamada wrote:
>> >> 2018-04-05 4:56 GMT+09:00 Don Zickus <dzickus@redhat.com>:
>> >> > We at Red Hat/Fedora have generally tried to have a per file breakdown of
>> >> > every config option we set.  This makes it easy for us to add new options
>> >> > when they are exposed and keep a changelog of why they were set.
>> >> >
>> >> > A Fedora example is here:
>> >> >   https://src.fedoraproject.org/cgit/rpms/kernel.git/tree/configs/fedora/generic
>> >> >
>> >> > Using various merge scripts, we build up a config file and run it through
>> >> > 'make listnewconfig' and 'make oldnoconfig'.   The idea is to print out new
>> >> > config options that haven't been manually set and use the default until
>> >> > a patch is posted to set it properly.
>> >> >
>> >> > To speed things up, it would be nice to make it easier to generate a
>> >> > patch to post the default setting.  The output of 'make listnewconfig'
>> >> > has two issues that limit us:
>> >> >
>> >> > - it doesn't provide the default value
>> >> > - it doesn't provide the new 'choice' options that get flagged in
>> >> >   'oldconfig'
>> >>
>> >>
>> >> So, 'listnewconfig' is a subset of 'listnewdefconfig'.
>> >>
>> >> I wonder if we could extend 'listnewconfig' to meet your demands
>> >> instead of adding the new target.
>> >
>> > Sure.  I am open to whatever you think is appropriate. :-)
>>
>>
>> I prefer extending the existing target.
>
> Ok.  So, you want me to respin with my additions added to listnewconfig,
> right?  Easy enough.


Yes, please.



-- 
Best Regards
Masahiro Yamada
