Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53516 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752322AbaHHNUg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Aug 2014 09:20:36 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6952975022
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Aug 2014 13:20:33 +0000 (UTC)
Message-ID: <53E4CEA1.8090207@suse.cz>
Date: Fri, 08 Aug 2014 15:20:33 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: firmware: fix build of external firmware
References: <53E34DDC020000780002A045@mail.emea.novell.com>
In-Reply-To: <53E34DDC020000780002A045@mail.emea.novell.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kbuild@vger.kernel.org

On 2014-08-07 09:58, Jan Beulich wrote:
> It looks like commit 5180d5f483 ("firmware: Simplify directory
> creation") uncovered a latent bug: The cmd_fwbin make macro, which is
> being called without any arguments, referenced argument 2, which I
> suppose previously just happened to be set to the right value (from an
> enclosing macro invocation - some make versions don't always properly
> clear unused macro arguments on nested macro invocations). In 3.16 with
> such make versions it now points into the source tree instead,
> resulting in build failure when building outside the source tree. And
> obviously on make versions properly clearing unused arguments it would
> have resolved to empty.

With which make version are you seeing the error?

Thanks,
Michal
