Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47540 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753947Ab0KCXZp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Nov 2010 19:25:45 -0400
Message-ID: <4CD1EF71.1090303@suse.cz>
Date: Thu, 04 Nov 2010 00:25:37 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild, deb-pkg: fix Architecture field when cross compiling
References: <1288654261-8269-1-git-send-email-asbjorn@asbjorn.biz> <4CD1E8C4.2020405@suse.cz>
In-Reply-To: <4CD1E8C4.2020405@suse.cz>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 3.11.2010 23:57, Michal Marek wrote:
> build a kernel for a different architecture. make rpm-pkg seems to
> suffer from the same problem, btw.

rpm-pkg actually handles this properly, it runs rpmbuild --target
$(UTS_MACHINE).

Michal
