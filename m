Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:41159 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751748Ab1KUScZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Nov 2011 13:32:25 -0500
Message-ID: <4ECA993B.2060407@linux.intel.com>
Date: Mon, 21 Nov 2011 10:32:27 -0800
From: Darren Hart <dvhart@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
References: <1321567131.25715.32.camel@work-vm> <1321685490-11706-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1321685490-11706-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: John Stultz <johnstul@us.ibm.com>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi Arnaud,

On 11/18/2011 10:51 PM, Arnaud Lacombe wrote:
> Hi,
> 
> On Thu, Nov 17, 2011 at 4:58 PM, john stultz <johnstul@us.ibm.com> wrote:
>> [...]
>>
>> v2:
>>  * Reworked to use alldefconfig instead of the proposed
>> olddefconfig as suggested by Sam Ravnborg.
>>
>> v3:
>>  * Script improvements from Dmitri.
>>  * allnoconfig option from Darren
>>  * pre-make exit option from Darren
>>  * lots of other fixes/cleanups from Darren.
>>  * Fix final check to not compain about config values in comments
>>
> If Dmitri and Darren have direct contribution to the script, shouldn't their
> Signed-off-by tag be present ?

Yes, that would be more correct.

> 
>> Please let me know if you have any comments or thoughts!
>>
>> CC: Sam Ravnborg <sam@ravnborg.org>
>> CC: gthelen@google.com
>> CC: tartler@cs.fau.de
>> CC: Dmitry Fink <Dmitry.Fink@palm.com>
>> CC: Darren Hart <dvhart@linux.intel.com>
>> CC: Eric B Munson <ebmunson@us.ibm.com>
>> CC: Bruce Ashfield <Bruce.Ashfield@windriver.com>
>> CC: Michal Marek <mmarek@suse.cz>
>> CC: linux-kbuild@vger.kernel.org
>> Signed-off-by: John Stultz <john.stultz@linaro.org>
> 
> You'll find below some more nits
> 
> 1) bail out early on error.
> 
> This fixes handling of non-existant file:
> 
> Before:
>     % sh scripts/kconfig/merge_config.sh non existant files
>     Merging non
>     sed: can't read non: No such file or directory
>     cat: non: No such file or directory
>     Merging existant
>     sed: can't read existant: No such file or directory
>     cat: existant: No such file or directory
>     Merging files
>     sed: can't read files: No such file or directory
>     cat: files: No such file or directory
>     scripts/kconfig/conf --alldefconfig Kconfig
>     #
>     # configuration written to .config
>     #
> 
> After:
> 
>     % sh scripts/kconfig/merge_config.sh non existant files
>     Merging non
>     sed: can't read non: No such file or directory

An early test (-f) of each non-option argument would be easy enough to
add, and would provide better error handling/reporting.

> 
> 2) re-implement argument parsing using sh(1) getopts builtin

I was trying to keep it simple - and I was also concerned about
colliding with dash/bash inconsistencies. I have no objection to getopt
if it works consistently in dash and bash. Did you test with dash as
well as bash?

> 
> 3) verify that the script was given enough argument to proceed. There isn't
> much point running the script with less than 2 arguments.

Sure.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
