Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33884 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751172AbaENUxp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 May 2014 16:53:45 -0400
Message-ID: <5373D7D6.2000708@suse.cz>
Date: Wed, 14 May 2014 22:53:42 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/5] firmware: Simplify directory creation
References: <1399639944-20551-1-git-send-email-mmarek@suse.cz> <1399639944-20551-2-git-send-email-mmarek@suse.cz> <20140509165158.GA9486@ravnborg.org>
In-Reply-To: <20140509165158.GA9486@ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

Dne 9.5.2014 18:51, Sam Ravnborg napsal(a):
> On Fri, May 09, 2014 at 02:52:20PM +0200, Michal Marek wrote:
>> When building the firmware blobs, use a simple loop to create
>> directories in $(objtree), like in Makefile.build. This simplifies the
>> rules and also makes it possible to set $(objtree) to '.' later. Before
>> this change, a dependency on $(objtree)/<dir> would be satisfied by
>> <dir> in $(srctree).
>>
>> When installing the firmware blobs, call mkdir like in Makefile.modinst.
>>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Michal Marek <mmarek@suse.cz>
> Looks good!
> This time I spent a little time to actually look through the code - and it
> end up being much simpler than before.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks. I merged the whole series to kbuild.git#kbuild.

Michal

