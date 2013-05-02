Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:35255 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751974Ab3EBT3U (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 May 2013 15:29:20 -0400
In-Reply-To: <20130502182850.GF6335@pomac.netswarm.net>
References: <20130502144403.GE6335@pomac.netswarm.net> <51829070.4070305@zytor.com> <20130502182850.GF6335@pomac.netswarm.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: Silent failure when missing bc
From: "H. Peter Anvin" <hpa@zytor.com>
Date: Thu, 02 May 2013 12:28:57 -0700
Message-ID: <16d56cce-24eb-4e91-b912-cfcf6a698414@email.android.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Kumlien <pomac@vapor.com>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz

Sorry, that is not how it works with external tools.  The point still holds: the job should have failed and make would have stopped.

Ian Kumlien <pomac@vapor.com> wrote:

>On Thu, May 02, 2013 at 09:12:32AM -0700, H. Peter Anvin wrote:
>> On 05/02/2013 07:44 AM, Ian Kumlien wrote:
>> > Hi, 
>> > 
>> > A dependency on bc was added at some point during the 3.9
>development.
>> > 
>> > My machines runs a git forest which contains both stable and
>Torvalds
>> > mainline. So any kernel version is only a:
>> > 	git fetch --all && git checkout <tag> away
>> > 
>> > When switching from v3.8.5 to v3.9-rc7 i ran in to a odd thing.
>> > 
>> > It seemed to build fine, make install and modules_install was all
>fine
>> > as well but rebooting revealed that 3.8.5 had been installed again
>> > instead.
>> 
>> Are you *sure* that the build didn't stop and you just didn't notice
>it?
>>  That is what the above sounds like.  Keep in mind that in a parallel
>> build there can be quite a few lines of output after the *** failure
>line...
>
>Damn it, i didn't see it in the 30+ line window, but yes there is a
>error message.
>
>Must have been more tired than i thought... 
>
>> > Doing make clean and rebuilding revealed that I was missing bc ;)
>> > 
>> > I have tried to find exactly where it's run since then, i have
>found the
>> > cmd_bc section but not found what triggers it... Due to lack of
>time and
>> > energy, I hearby report this bug!
>> > 
>> > This is about as far as i got:
>> > kernel/Makefile:135:quiet_cmd_bc  = BC      $@
>> > kernel/Makefile:136:      cmd_bc  = bc -q $(filter-out FORCE,$^) >
>$@
>> > 
>> > Is there any detaled information and or instructions on kbuild btw?
>> 
>> The disconcerting thing here, of course, is if the build would have
>> looked like it completed without the file actually being generated. 
>It
>> should have failed either to generate the file, or it should have
>> produced an empty header which would have caused a failure further
>down
>> the line...
>
>Imho it should have had bc as a dependency and failed to run that step.
>
>Ie instead of "/bin/sh: bc: command not found"
>
>Do we know which tools we need? could we add them as "make
>dependencies"?
>
>> 	-hpa
>> 

-- 
Sent from my mobile phone. Please excuse brevity and lack of formatting.
