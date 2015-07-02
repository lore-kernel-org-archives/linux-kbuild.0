Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:44566 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751960AbbGBJpQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 05:45:16 -0400
Message-ID: <1435830314.2423.16.camel@tiscali.nl>
Subject: Re: kconfig xconfig port to Qt 5
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 02 Jul 2015 11:45:14 +0200
In-Reply-To: <1462835.V8cvkXcCv0@tjmaciei-mobl4>
References: <1462835.V8cvkXcCv0@tjmaciei-mobl4>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thiago Macieira <thiago.macieira@intel.com>
Cc: Boris Barbulovski <bbarbulovski@gmail.com>, linux-kbuild@vger.kernel.org

[Yann has disappeared. But you couldn't know that.]

On zo, 2015-06-28 at 18:44 -0700, Thiago Macieira wrote:
> First things first: the MAINTAINERS file lists 
> git://gitorious.org/linux-kconfig/linux-kconfig as the repository for 
> upstream 
> sources, but Gitorious is no longer working and that is unavailable. 
> Do you 
> have an updated URL?

I'm guessing the current development tree is found in the kconfig branch
of git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git 

> Second: how do you prefer these changes? Boris made 37 commits, each 
> making a 
> small part of the port. Do you want each change individually, or would 
> you 
> like me to squash them?

Probably the easiest way to get an answer to that question is to submit
the series (in as many patches as you think are actually needed) and see
how people react.

Hope this helps,


Paul Bolle
