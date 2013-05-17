Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:55188 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750712Ab3EQEWs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 May 2013 00:22:48 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [RFC] mconf: suppress empty submenus
In-Reply-To: <20130516230404.GB19534@free.fr> (Yann E. MORIN's message of
	"Fri, 17 May 2013 01:04:04 +0200")
References: <1368626738-31911-1-git-send-email-dirk@gouders.net>
	<20130516230404.GB19534@free.fr>
Date: Fri, 17 May 2013 06:22:45 +0200
Message-ID: <ghip2ikzfu.fsf@mx10.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Dirk, All,
>
> On 2013-05-15 16:05 +0200, Dirk Gouders spake thusly:
>> I noticed that sometimes it happens that there are empty
>> submenus, and I tried to see if they can't be suppressed
>> by mconf (if not explicitely done by the kbuild-language).
>
> I think we still want submenus to be visible if they are not hidden by
> any condition in the Kconfig. If the developper did not explicitly add
> masking condition, we should *not* try to mask it from the frontends.
>
> However, I agree that entering an empty menu can just be deceptive. If
> we could find a way to render an empty menu, and prevent the user from
> entering it, then that would be a huge win, I think.
>
> For example, menus are rendered as thus for now:
>
>     This is a submenu  --->
>
> What about representing empty submenus as thus:
>
>     This is a submenu  ----
>
> Also, we have menuconfig which are simply empty if not selected, but can
> anyway be entererd like any other submenu:
>
>     [ ] menuconfig entry  --->
>         (Always empty when entered if not selected)
>
> which could be similarly rendered as:
>
>     [ ] menuconfig entry  ----
>
> This one is really deceptive, and should be handled in the same scheme
> as well.

Hello Yann,

I like that scheme.  Maybe ---- can become ---0 or similar for better
perceptibility, but I think what counts would be that the user knows
that we know that there are empty menus/menuconfigs and we are treating
them properly.

What I also like is that I think this scheme would justify a new
function "menu_is_empty()" and we do not need to change the current
behavior of "menu_is_visible()".

While playing with the empty menus, I noticed that there are some more
things that probably should be fixed and that I have on my list:

* mconf: Using Arrow-Keys should be handled properly (for empty menus)
         (The point why I thought users get irritated by empty submenus)
* mconf: "Z" does not work in empty menus
* expr.c: Some days ago, there was a timeslot when "IRQ subsystem" had
          just one config with a prompt in it and I tried to make the
  visibility of the menu dependent on the same symbol as the
  only one config option.

  That did not work and I found out that this is because of the
  expr_eliminate_dups* family of functions.  I am still figuring out if
  this is correct behavior or if I just misread the kconfig-language
  documentation.  The attached Kconfig that I use to trigger exactly that
  point, also outputs an error because of an expression with an unknown
  type when "Z" is pressed.


Dirk

------------------------------------------------------------------------
mainmenu "Kconfig Testing Configuration"

config MAY_TEST_VAR
	def_bool y

config SRCARCH
	string
	prompt "srcarch"
	option env="SRCARCH"
	---help---
	Helptext

menu "Testmenu"
	visible if MAY_TEST_VAR

config TEST_VAR
	bool "Test option" if MAY_TEST_VAR
	---help---

	  Help for TEST_VAR

endmenu
