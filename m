Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:52537 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752522AbeFFX4y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jun 2018 19:56:54 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [RFC 0/1] mconf: Emacs-like isearch
In-Reply-To: <f833ff8b-75ed-3ca4-ec24-a129a05902d1@infradead.org> (Randy
        Dunlap's message of "Wed, 6 Jun 2018 16:31:44 -0700")
References: <20180606215616.12817-1-dirk@gouders.net>
        <a594b5a7-d5c8-e938-df4e-dbba93ff3837@infradead.org>
        <ghzi07v944.fsf@lena.gouders.net>
        <f833ff8b-75ed-3ca4-ec24-a129a05902d1@infradead.org>
Date: Thu, 07 Jun 2018 01:54:30 +0200
Message-ID: <ghr2ljv5c9.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> On 06/06/2018 03:32 PM, Dirk Gouders wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
>> 
>>> On 06/06/2018 02:56 PM, Dirk Gouders wrote:
>>>> Hello,
>>>>
>>>> being an Emacs user, I frequently find myself pressing CTRL-s in mconf
>>>> to search for some menu entry, especially in large menus.
>>>>
>>>> I decided to implement a basic isearch in mconf and would like to hear
>>>> if others find this functionality useful, as well.
>>>>
>>>> The new functionality is started with pressing CTRL-s followed by
>>>> characters that form the search string.  To search for further
>>>> occurences of an entered string, press CTRL-s instead of further
>>>> characters.
>>>>
>>>> For example: to navigate to the USB device drivers, press CTRL-s de ENTER ENTER usb ENTER ENTER
>>>
>>> Not being an emacs user, what is the "de" for above?
>> 
>> "de" (with my .config) causes a match for "Device Drivers" --
>> no other menu entry matching the string "de" is befor that entry.
>> 
>
> Device Drivers is the first match for me also.
>
> To get to the USB drivers, I have to enter:
> 	CTRL-s de ENTER ENTER CTRL-s usb ENTER ENTER

Yes, I left out the second CTRL-s, thank you!

Oh well, I shouldn't have sent this late at night, then I would probably
have explained the needed input as:

     1) CTRL-s  // start isearch
     2) de      // substring that matches "Device Drivers"
     3) ENTER   // quit isearch
     4) ENTER   // enter Device Drivers menu
     5) CTRL-s  // start isearch
     6) usb     // navigate to USB support
     7) ENTER   // quit isearch
     8) ENTER   // enter USB support menu

Again, I'm really sorry for the confusion.

Dirk
