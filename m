Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44244 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750958AbbCQU7Q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Mar 2015 16:59:16 -0400
Message-ID: <550895A1.1000901@suse.cz>
Date: Tue, 17 Mar 2015 21:59:13 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: fix link-vmlinux.sh bash-ism
References: <20141229163456.GB27533@dhcppc1> <54A6BF7E.8070003@suse.cz> <20150303163453.GA21318@localhost.localdomain>
In-Reply-To: <20150303163453.GA21318@localhost.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sylvain BERTRAND <sylvain.bertrand@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 3.3.2015 v 17:34 Sylvain BERTRAND napsal(a):
> On Fri, Jan 02, 2015 at 04:55:42PM +0100, Michal Marek wrote:
>> On 2014-12-29 17:34, Sylvain BERTRAND wrote:
>>> Chocked while compiling linux with dash shell instead of bash shell.
>>> See:
>>> http://pubs.opengroup.org/onlinepubs/000095399/utilities/trap.html
>>
>> Please describe the actual problem in the changelog. I guess it's
>> because of the 'ERR' trap?
> 
> Indeed:
>  - ERR is specific to bash
>  - signal names in a trap built-in instruction should be without the SIG prefix
> 
> Shall I repost a v2 with the above lines?

Sorry if I wasn't clear. The changelog should contain the actual error
message or description of wrong behavior when ran under dash.

Michal
