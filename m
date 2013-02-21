Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33672 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754767Ab3BUX0R (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Feb 2013 18:26:17 -0500
Message-ID: <5126AD1A.3080104@suse.cz>
Date: Fri, 22 Feb 2013 00:26:18 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Size of images in make-kpkg and make deb-pkg
References: <CALZVapk=-8t8BihTSoTJ=Fh3C9xBtDc9ETpmGpjNBrTYiJLF7g@mail.gmail.com> <5126AA4B.2080600@suse.cz> <CALZVapn9TZNqeWXQry2_Zw9okOFKspeNRpeQJjENuHddx2aX+g@mail.gmail.com>
In-Reply-To: <CALZVapn9TZNqeWXQry2_Zw9okOFKspeNRpeQJjENuHddx2aX+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Javier Domingo <javierdo1@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 22.2.2013 00:22, Javier Domingo wrote:
> Is there any way to get rid of the full debuginfo?

See CONFIG_DEBUG_INFO and CONFIG_DEBUG_INFO_REDUCED. And please do not
top-post.

Michal


