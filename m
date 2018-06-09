Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:35780 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752911AbeFIA7i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 20:59:38 -0400
Subject: Re: [RFC v4 1/1] i-search functionality for mconf
References: <20180608184606.5029-1-dirk@gouders.net>
 <20180608184606.5029-2-dirk@gouders.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6cd5ead5-c24e-d2e2-e87e-eb2c1f7b5672@infradead.org>
Date: Fri, 8 Jun 2018 17:59:27 -0700
MIME-Version: 1.0
In-Reply-To: <20180608184606.5029-2-dirk@gouders.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>, Sam Ravnborg <sam@ravnborg.org>

On 06/08/2018 11:46 AM, Dirk Gouders wrote:
> This patch prototypes isearch functionality for mconf based on an idea of
> Sam Ravnborg:
> 
> * mconf now distinguishes if the focus is on the menu items or the
>   buttons below it.
> 
> * At startup focus is on the menu items and alphanumeric
>   characters or space entered are used to form a string that is
>   searched for.
> 
> * BACKSPACE is used to remove the last character of the search string.
> 
> * ENTER can be used to enter a submenu.
> 
> * Horizontal arrow keys put focus on the buttons with the known
>   behavior.
> 
> * The TAB key is now exclusively used to toggle the focus.
> 
> * Vertical arrow keys work anywhere.
> 
> * When the focus is on the buttons, all keys (e.g. hotkeys) work the
>   same as before this change.
> 
> * '\' can be used to search for other occurences of an already entered
>   string.
> 
> * To use y|n|m on an item, focus has to be on the buttons.
> 
> An example to navigate into the USB support menu under Device Drivers:
> 
>    1) de		# Navigates to the item "Device Drivers"
>    2) ENTER		# Enter the submenu
>    3) USB		# Navigate to the item "USB support"
>    4) ENTER		# Enter the submenu

Hi Dirk,

Much like Sam, I got locked in isearch mode.  The TAB key would not switch
into the buttons focus.  I had to kill it.


-- 
~Randy
