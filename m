Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:58794 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751490Ab1DSID1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Apr 2011 04:03:27 -0400
Message-ID: <4DAD41CE.5060702@suse.cz>
Date: Tue, 19 Apr 2011 10:03:26 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: LOCALVERSION in setlocalversion
References: <BANLkTikYuYVvXiHvi_kr2H7n29k=veThtw@mail.gmail.com>	<4DAD327B.4030904@suse.cz> <BANLkTikspr9jVNF-VZbnc_MxUYNWad7Kkg@mail.gmail.com>
In-Reply-To: <BANLkTikspr9jVNF-VZbnc_MxUYNWad7Kkg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 19.4.2011 09:35, Haojian Zhuang wrote:
> I still have a question. I can't find the semantic of
> ${LOCALVERSION+set} in some
> shell tutorials. Could you help me to figure out a link of introducing this?

It's a test if LOCALVERSION is set or not. See for instance
http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html#tag_02_06_02,
scroll down to the table that explains the various expansions.

Michal
