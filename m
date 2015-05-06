Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40179 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752619AbbEFOZ3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 May 2015 10:25:29 -0400
Message-ID: <554A2457.70609@suse.cz>
Date: Wed, 06 May 2015 16:25:27 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: fix link-vmlinux.sh bash-ism
References: <20141229163456.GB27533@dhcppc1> <54A6BF7E.8070003@suse.cz> <20150303163453.GA21318@localhost.localdomain> <550895A1.1000901@suse.cz> <20150427152525.GA22179@freedom> <20150506135422.GA24849@freedom>
In-Reply-To: <20150506135422.GA24849@freedom>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sylvain.bertrand@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2015-05-06 15:54, sylvain.bertrand@gmail.com wrote:
> On Mon, Apr 27, 2015 at 03:25:25PM +0000, sylvain.bertrand@gmail.com wrote:
>> On Tue, Mar 17, 2015 at 09:59:13PM +0100, Michal Marek wrote:
>>> Sorry if I wasn't clear. The changelog should contain the actual error
>>> message or description of wrong behavior when ran under dash.
>>
>> While building linux with dash shell:
>>   LINK    vmlinux
>> trap: SIGHUP: bad trap
>> /src/linux-4.0/Makefile:933: recipe for target 'vmlinux' failed
>> make[1]: *** [vmlinux] Error 1
> 
> Hi, what's up with this?

Please post a v2 with a complete changelog.

Michal

