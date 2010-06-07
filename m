Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from jack.hrz.tu-chemnitz.de ([134.109.132.46]:59842 "EHLO
	jack.hrz.tu-chemnitz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750955Ab0FGRMw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Jun 2010 13:12:52 -0400
From: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>
Subject: Re: [PATCH] kconfig qconf: port to QT4
Date: Mon, 7 Jun 2010 19:12:53 +0200
References: <1275846668-17863-1-git-send-email-alexander.stein@informatik.tu-chemnitz.de> <4C0CE9FC.60905@suse.cz>
In-Reply-To: <4C0CE9FC.60905@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <201006071912.54313.alexander.stein@informatik.tu-chemnitz.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

Hello Michal,

Am Montag 07 Juni 2010, 14:45:48 schrieb Michal Marek:
> I've only very little experience with Qt 3 or 4. The patch basically
> changes most QSomeClass to Q3SomeClass, which is the Qt3-compatible
> wrapper around QSomeClass. Now is it possible to still support Qt3? E.g.
> have a header file that #defines Q3SomeClass back to QSomeClass and does
> similar with the Qt headers, would that be possible? I know that Qt4 has
> be there for five years already, but if the cost of keeping support for
> old userspace is not too hight, I would try it.

I never thought about qt3 compatibility but It seems to me that renaming the 
qt3 compat classes and revert the header file name changes should suffice to 
compile against qt3 again. But then somebody else has to do the makefile magic 
to support both versions. Also which version should be prefered if both are 
available?

> BTW, after applying your patch, make xconfig starts ok, but clicking in
> the main menu does nothing, and if I close the close button, it does not
> exit, but stops reacting to any input (but it still handles window
> resize). The qt3 version would display the "Save changes?" dialog here.

I can click in the window around and closing the window using the X button 
asks me about saving the changes. Which QT version do you use actually?

Best regards
Alexander
