Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42027 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754073Ab1EQLh2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 May 2011 07:37:28 -0400
Message-ID: <4DD25DF7.7090407@suse.cz>
Date: Tue, 17 May 2011 13:37:27 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Add $KERNELRELEASE to firmware install path
References: <20110505173939.GA20575@dev1756.snc6.facebook.com>	 <4DC3CA39.30806@suse.cz> <1304677113.20656.2.camel@i7.infradead.org>	 <20110506184438.GA30417@dev1756.snc6.facebook.com>	 <1304708557.20656.49.camel@i7.infradead.org>	 <20110506223727.GA29011@dev1756.snc6.facebook.com>	 <20110516142118.GM13293@sepie.suse.cz> <1305631419.8008.106.camel@i7.infradead.org>
In-Reply-To: <1305631419.8008.106.camel@i7.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Arun Sharma <asharma@fb.com>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On 17.5.2011 13:23, David Woodhouse wrote:
> On Mon, 2011-05-16 at 16:21 +0200, Michal Marek wrote:
>>
>> make deb-pkg generates a separate package with the firmware files. I
>> would suggest we do the same for rpm.
>
> No. You should ignore the firmware files *completely*.

make modules_install should ignore them completely. Whether the files 
are installed directly in /lib/{modules,firmware} or packaged in a rpm 
and transferred to another machine does not make any difference.

Michal
