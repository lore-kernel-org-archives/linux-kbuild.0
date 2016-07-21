Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41792 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752077AbcGUTnH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Jul 2016 15:43:07 -0400
Subject: Re: "Save as" option doesn't work in xconfig tool.
References: <1469127299.15038.9.camel@synopsys.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3ae9681c-cbbb-8448-6920-bbb4970158db@infradead.org>
Date: Thu, 21 Jul 2016 12:43:05 -0700
MIME-Version: 1.0
In-Reply-To: <1469127299.15038.9.camel@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "mmarek@suse.com" <mmarek@suse.com>, "thiago.macieira@intel.com" <thiago.macieira@intel.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Vlad Zakharov <Vladislav.Zakharov@synopsys.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 07/21/16 11:54, Eugeniy Paltsev wrote:
> How to reproduce:
> Open xconfig tool with next command: "make xconfig"
> Open "file" menu and select "Save as..." option.
> Enter the file name and press "Save" button.
> Quit from xconfig tool.
> The file wouldn't be created.
> 
> Kernel version is 4.7-rc7.
> 
> Any ideas what I'm doing wrong?

I think nothing.  It fails for me also.


-- 
~Randy
