Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:41016 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754455AbeFTSVf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jun 2018 14:21:35 -0400
Subject: Re: [RFC v8 1/1] mconf: global i-search in menu prompts
References: <20180620084217.8597-1-dirk@gouders.net>
 <20180620084217.8597-2-dirk@gouders.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f02cc7c6-d92e-24f3-b0ad-df9e6bf7630a@infradead.org>
Date: Wed, 20 Jun 2018 11:21:28 -0700
MIME-Version: 1.0
In-Reply-To: <20180620084217.8597-2-dirk@gouders.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>, Sam Ravnborg <sam@ravnborg.org>

Hi,

On 06/20/2018 01:42 AM, Dirk Gouders wrote:
> 
> Operation
> ---------
> The TAB key is reserved to toggle the focus between menu and bottons.
> Focus is on the buttons if one of the buttens (the active one) is
> hightlighted, otherwise it is on the menu.
> 
> When the focus is on the buttons, mconf operates as before with the
> exception of the TAB key.
> 
> When the focus is on the menu, mconf operates in i-search mode and the
> following input has special meaning:
> 
> * <\> (backslash) can be used to search for other occurences of an
>   already entered string.  On empty search strings, nothing happens.
> 
> * Any other printable character than backslash and '\n' is appended to
>   the current search string and a match is searched for.  If a match
>   is found, it is immediately navigated to.

About that paragraph above:  I tried to search for "fs-cache", as in:

config FSCACHE_DEBUG
	bool "Debug FS-Cache"

but i-search does not allow me to enter a '-' character.  Seems odd to me.


Still doing other testing...


> * BACKSPACE is used to remove the last character of the search string.
> 
> * DEL clears the search string.
> 
> * ENTER can be used to enter a submenu.
> 
> * ESC ESC exits the current isearch and clears the search string.
> 
> * Horizontal arrow keys still cycle between the buttons but also
>   switch focus to the buttons.
> 
> * Vertical arroy keys navigate the menu items.
> 
> At any time, at most one i-search is active and the navigation path to
> the current menu is displayed in the subtitle, the second line in the
> menu window.
> 
> Navigation example:
> 
> To navigate to options concerning NFS file systems, simply type 'n',
> 'f' and 's'.
> 
> Hint: use the 'z' key with focus on buttons to search for invisible
>       prompts.

-- 
~Randy
