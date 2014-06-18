Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54068 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751285AbaFRP6l (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Jun 2014 11:58:41 -0400
Message-ID: <53A1B72E.7030907@infradead.org>
Date: Wed, 18 Jun 2014 08:58:38 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: relative objtree change broke tar builds?
References: <20140617223854.GC6168@fieldses.org> <53A15684.9000002@suse.cz> <20140618122029.GA17790@fieldses.org> <53A18712.6030907@suse.cz> <20140618131452.GB17790@fieldses.org>
In-Reply-To: <20140618131452.GB17790@fieldses.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/18/14 06:14, J. Bruce Fields wrote:
> On Wed, Jun 18, 2014 at 02:33:22PM +0200, Michal Marek wrote:
>> Dne 18.6.2014 14:20, J. Bruce Fields napsal(a):
>>> On Wed, Jun 18, 2014 at 11:06:12AM +0200, Michal Marek wrote:
>>>> Dne 18.6.2014 00:38, J. Bruce Fields napsal(a):
>>>>> The changelog there says
>>>>>
>>>>> 	The main Makefile sets its working directory to the object tree
>>>>> 	and never changes it again. Therefore, we can use '.' instead of
>>>>> 	the absolute path.
>>>>>
>>>>> But the main Makefile also exports objtree, and a quick grep suggests
>>>>> lots of other uses outside the main Makefile.
>>>>
>>>> Do you have examples? Besides your report, I'm only aware of make
>>>> deb-pkg and make *docs. What else?
>>>
>>> I haven't looked.
>>>
>>> I only note that grep finds 47 files referencing that variable, and
>>> absent some argument that the remaining ones are correct, I'd be
>>> inclined to revert.
>>
>> Do these 47 files change the working directory before referencing the
>> variable?
> 
> Sorry, I'm not volunteering to check.
> 
> Note also that other variables are defined in terms of objtree, and they
> may be exported or passed to other scripts.


I'll note one side effect that I really dislike:
If not in silent mode, scripts/mkmakefile tells me that the it is
generating ./Makefile.  I want to see the real path there instead of '.'.


-- 
~Randy
