Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.HRZ.Uni-Dortmund.DE ([129.217.128.51]:40275 "EHLO
	unimail.uni-dortmund.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753360Ab3HDPka (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 Aug 2013 11:40:30 -0400
Message-ID: <51FE75EC.4060507@tu-dortmund.de>
Date: Sun, 04 Aug 2013 17:40:28 +0200
From: =?UTF-8?B?RGF2aWQgR3LDpGZm?= <david.graeff@tu-dortmund.de>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] Gtk/Qt interface flavours ported to newest toolkit
 versions
References: <kconfig-port-gtk-qt> <1375612711-17140-1-git-send-email-david.graeff@web.de> <20130804110244.GA3481@free.fr>
In-Reply-To: <20130804110244.GA3481@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

Yann, All,

I've checked your kconfig-frontends project [0] and very much liked your
restructuring of the kconfig dir. What's the reason not to "upstream" this
structure?
Actually the root Makefile of the kconfig dir still offer the same 
targets, so
no "legacy" or out of tree applications should be affected negativly. Am I
missing something?

[0]http://ymorin.is-a-geek.org/projects/kconfig-frontends


Am 04.08.2013 13:02, schrieb Yann E. MORIN:
>> I prepared a rebased V2 of the patchset. As far as I get the consensus
>> is to replace the existing Qtk and Qt flavours because there exist a
>                               ^^^
> Qtk, a new toolkit as a merge of Gtk and Qt? ;-)
Wouldn't that be awesome :D
> Anyway, I like how you cleaned up scripts/kconfig by moving frontends to
> their own sub-dir.
>
> /me wonders how much kconfig-frontends [0] will be impacted by this
> reordering...
I've tested all available frontends after my move-into-subdir
changes (n-/menu-/g-/xconfig). I had to fix some include paths in the
first commit, but big changes regarding to your project
only affect the gconf/qconf dirs.
Different from the kernel kconf, you have used special autotool rules like
AM_V_MOC etc for Qt, I didn't know those exist.
> You want to send patches to the list for people to review them and
> comment. You don't use pull-requests for this, since the pull-request
> only contains a single mail [1] with the URL to pull from.
>
> Once everything is OK, either the maintainer will apply those patches,
> or a sub-maintainer will do it and send a pull-request for 'big' series.
>
> So, you did well to send patches.
Ok, understood :)

Regards,
David
