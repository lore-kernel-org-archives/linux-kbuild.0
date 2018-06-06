Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:47069 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752403AbeFFWfk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jun 2018 18:35:40 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [RFC 0/1] mconf: Emacs-like isearch
In-Reply-To: <a594b5a7-d5c8-e938-df4e-dbba93ff3837@infradead.org> (Randy
        Dunlap's message of "Wed, 6 Jun 2018 15:24:06 -0700")
References: <20180606215616.12817-1-dirk@gouders.net>
        <a594b5a7-d5c8-e938-df4e-dbba93ff3837@infradead.org>
Date: Thu, 07 Jun 2018 00:32:59 +0200
Message-ID: <ghzi07v944.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> On 06/06/2018 02:56 PM, Dirk Gouders wrote:
>> Hello,
>> 
>> being an Emacs user, I frequently find myself pressing CTRL-s in mconf
>> to search for some menu entry, especially in large menus.
>> 
>> I decided to implement a basic isearch in mconf and would like to hear
>> if others find this functionality useful, as well.
>> 
>> The new functionality is started with pressing CTRL-s followed by
>> characters that form the search string.  To search for further
>> occurences of an entered string, press CTRL-s instead of further
>> characters.
>> 
>> For example: to navigate to the USB device drivers, press CTRL-s de ENTER ENTER usb ENTER ENTER
>
> Not being an emacs user, what is the "de" for above?

"de" (with my .config) causes a match for "Device Drivers" --
no other menu entry matching the string "de" is befor that entry.

>
>> Pressing just CTRL-s subsequently results in line-by-line navigation
>> through the menu (search for empty strings).
>> 
>> The isearch is terminated by pressing either ESC ESC or ENTER.
>> 
>> Because I expect that errors are found in the code and changes are requested, I
>> completely left out the documentation part and will add it to V2
>> should anyone find this functionality useful.
>
> Hm, it seems to take 2 entries of Ctrl-s to begin the search??
> No, it takes 2 entries of Ctrl-s to display the "isearch:" prompt,
> but entering one Ctrl-s + a string will display it also.
>
> Anyway, I am having trouble getting the USB drivers example to work.

Yes, I should have stated that this example explains what _I_ have to do to
navigate to the USB device drivers.  Probably, "de" in your case matches
some other menu entry and the navigation requires more or other input.

I'm sorry for causing confusion.

Dirk

>> Thanks,
>> 
>> Dirk
>> 
>> Dirk Gouders (1):
>>   Emacs-like isearch for mconf.
>> 
>>  scripts/kconfig/lxdialog/dialog.h  |   5 ++
>>  scripts/kconfig/lxdialog/menubox.c | 140 ++++++++++++++++++++++++++++++++++++-
>>  scripts/kconfig/lxdialog/util.c    |   1 +
>>  3 files changed, 145 insertions(+), 1 deletion(-)
>> 
>
> thanks,
