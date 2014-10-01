Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47766 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753017AbaJAVVb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Oct 2014 17:21:31 -0400
Message-ID: <542C7058.8090001@suse.cz>
Date: Wed, 01 Oct 2014 23:21:28 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] kbuild: fake the "Entering directory ..." message
 more simply
References: <1410260544-22657-1-git-send-email-yamada.m@jp.panasonic.com> <1410260544-22657-2-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1410260544-22657-2-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Dne 9.9.2014 13:02, Masahiro Yamada napsal(a):
> Commit c2e28dc975ea87feed84415006ae143424912ac7
> (kbuild: Print the name of the build directory)
> added a gimmick to show the "Entering directory ...".
> 
> Instead of echoing the hard-coded message (that is, we need to know
> the exact message), moving --no-print-directory would be easier.

It now prints the localized text for me. But I guess I'm getting what I
asked for :). Applied to kbuild.git#kbuild.

Michal
