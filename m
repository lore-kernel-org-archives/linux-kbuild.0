Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55396 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752445Ab2H2O1z (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Aug 2012 10:27:55 -0400
Message-ID: <503E26E7.7070208@suse.cz>
Date: Wed, 29 Aug 2012 16:27:51 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: is there any value in exporting <linux/irqnr.h> to userspace?
References: <alpine.DEB.2.02.1208271539040.10687@oneiric>
In-Reply-To: <alpine.DEB.2.02.1208271539040.10687@oneiric>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 27.8.2012 21:42, Robert P. J. Day wrote:
> 
>   given that irqnr.h is completely wrapped in a __KERNEL__ test, it
> ends up in userspace with no actual content, and the only header file
> that includes it is random.h.  so would it not make sense to drop that
> #include from random.h, then drop irqnr.h from being exported?

Yes. Please submit a patch and CC lkml.

Michal
