Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42603 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932428Ab0AFUst (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jan 2010 15:48:49 -0500
Message-ID: <4B44F730.4070800@suse.cz>
Date: Wed, 06 Jan 2010 21:48:48 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] wrap long help lines, take two
References: <3b09bd800912142246u2d069702n759e165553bddc9f@mail.gmail.com> 	<4B279021.6070508@suse.cz> <3b09bd800912152056g40fab3f9q76aef60ccf525bd0@mail.gmail.com> 	<4B28CC39.9010307@suse.cz> <3b09bd800912200029u24764aeje3063fb32de0fa90@mail.gmail.com>
In-Reply-To: <3b09bd800912200029u24764aeje3063fb32de0fa90@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?IlZhZGltIEJlbmRlYnVyeSAo0LLQsSki?= <vbendeb@google.com>
Cc: linux-kbuild@vger.kernel.org

Vadim Bendebury (вб) napsal(a):
> Michal I looked at it a bit more, it seems that passing the width as
> an argument to expr_gstr_print() is not such a good idea, especially
> since it needs to originate in mconf.c:show_help() and make it all the
> way to expr.c:expr_print_gstr_helper() - it's quite a few nested calls
> where the argument needs to propagate through.
> 
> I ended up modifying the gstr structure adding a field to specify the
> max width. It is excessive for other than mconf modes, but it seems a
> small price to pay  to get a smallest contained change.
> 
> Please let me know what you think and if I need to resend the patch in
> a separate email:

Hi Vadim,

sorry for the delay. Yes this patch looks ok, I added it to the kbuild tree.

Thanks!
Michal
