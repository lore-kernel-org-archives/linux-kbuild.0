Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36002 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756369AbaDHPTx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Apr 2014 11:19:53 -0400
Message-ID: <53441398.2020709@suse.cz>
Date: Tue, 08 Apr 2014 17:19:52 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: create a build directory automatically for out-of-tree
 build
References: <1396251696-14815-1-git-send-email-yamada.m@jp.panasonic.com> <20140331203615.GA22334@ravnborg.org> <533AFB06.6020207@infradead.org>
In-Reply-To: <533AFB06.6020207@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 2014-04-01 19:44, Randy Dunlap wrote:
> On 03/31/2014 01:36 PM, Sam Ravnborg wrote:
>> In the past I have rejected such patches - but today I fail to recall why.
> 
> I believe that it was due this kind of patch allowing typos to cause
> builds that one does not want to make.
> 
> E.g., if I already have O=OUT1 directory and I mistype O=OUT2, this will cause
> a full build (potentially) in OUT2, even if it should do a small rebuild in
> OUT1 instead.

I thought about this possibility before applying the patch. But if this
happens, then a build in the mistyped directory will immediately fail
due to lack of .config.

Michal

