Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:55274 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750720AbcKAPwq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Nov 2016 11:52:46 -0400
Subject: Re: please, where has xconfig KConf option documentation gone with
 linux 4.8's Qt5 / Qt4 xconfig ?
References: <CALyZvKyveULRX56yZz1nx96ZjDoo3JKPAFqj=29p++nx=sGHVw@mail.gmail.com>
 <3077d5cb-9a8a-5d3e-cd00-ce3ad5cb3406@infradead.org>
 <CALyZvKwe+NmGn=3NY=TMBtPHGYgt2KTP0G9OjO6w_gG=VDLUrg@mail.gmail.com>
 <5d04ac9f-8cf5-3f1a-4943-16dbfd24f0fc@infradead.org>
 <f1c8288a-7a28-da2b-1b4a-699d2effa223@infradead.org>
 <CAOfo6n8EgfQacWyUnv7ax4eb4cXizcW7ZuOTn5GDZyPRs6gaSg@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7d814ee3-3ee0-df39-0066-ea61df59939c@infradead.org>
Date: Tue, 1 Nov 2016 08:52:39 -0700
MIME-Version: 1.0
In-Reply-To: <CAOfo6n8EgfQacWyUnv7ax4eb4cXizcW7ZuOTn5GDZyPRs6gaSg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Boris Barbulovski <bbarbulovski@gmail.com>
Cc: Jason Vas Dias <jason.vas.dias@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Thiago Macieira <thiago.macieira@intel.com>, Michal Marek <mmarek@suse.cz>

On 11/01/16 05:17, Boris Barbulovski wrote:
> hi Randy,
> 
> Frankly I don't have answer to your questions, but I did reproduced
> the issues you described.
> 
> And found that:
> 
> * `Show Debug Info` menu item was(created, but) not added to the menu.
> * if the `showDebug` setting was set to true, the the initial widgets
> state will not be set correctly.
> 
> I did a patch of those issues fixed.
> 
> If you choose to keep the `showDebug` stuff in, you can checkout/test the patch.

Your patch works ... but I don't find the Show Debug Info option to be
useful, so I would just remove it completely.

anyone else have views on this?

thanks.

> On Tue, Nov 1, 2016 at 3:47 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
>> On 10/17/16 10:28, Randy Dunlap wrote:
>>> Boris or Thiago,
>>>
>>> Any comments, suggestions, or patches about this?
>>>
>>> thanks.
>>
>> Hi Boris and Thiago,
>>
>> Other than you patch of Oct. 17 (which needs to be added to linux-kconfig for
>> linux-next testing), the OP (Jason) mentioned that the xconfig "Help, Introduction"
>> mentions a toggle called "Show Debug Info" but there is no such option under
>> the Option menu.
>>
>> The qconf.cc source file does contain a boolean called _showDebug. How is it
>> used?  It appears to only be settable by editing the .config/kernel.org/qconf.conf
>> file:
>> qconf\help\showDebug=false
>> and changing that 'false' to 'true'. Doing that still does not show any debug options
>> in the xconfig windows. What it appears to do is to highlight (via html) the kconfig
>> keywords so that the user can click on them, but when I do that, nothing useful
>> happens (they just disappear!).
>>
>> So the questions are basically:
>>
>> 1. should be Help/Introduction text be cleaned up so that it does not refer to
>> Show Debug Options? or should that toggle be reinstated?
>>
>> 2. how is /showDebug used? should it be documented? should it be fixed?
>> should it be deleted?
>>
>> Thanks.
>>
>>> On 10/15/16 04:09, Jason Vas Dias wrote:
>>>>  Aha, thanks! I never would have known this without being told -
>>>>  there is no visible indication that the symbol info pane exists
>>>>  at all until one tries to drag the lower right corner of the window
>>>>  notth-eastwards - is this meant to be somehow an intuitive thing to
>>>>  do these days to view more info ?
>>>>
>>>>  I did manage to view the option documentation with nconfig  /
>>>>  using emacs to view the KConf files (preferable).
>>>>
>>>>  Really, it would be nice if xconfig had some 'View' Menu & one could select
>>>>  View -> Option Documentation  or press <F1> over an option to view the
>>>>  documentation for it , and if the geometry of the different panes was
>>>> correct at
>>>>  startup .- the whole Option value pane initially appears on the far right hand
>>>>  side, about 10 pixels wide , until resized ; and there really is no sign of the
>>>>  documentation pane at all until lower right-hand corner dragged.
>>>>
>>>>  Also, in the Help -> Introduction panel, it says :
>>>>    "Toggling Show Debug Info under the Options menu will show the
>>>> dependencies..."
>>>>  but there is no "Show Debug Info" option on the Options menu - sounds like
>>>>  it might be a useful feature - should I be seeing a "Show Debug Info" option ?
>>>>  why don't I see one ?  Maybe the Options menu might be a good place to put
>>>>  an "Expand Option Documentation Pane" option ?
>>>>
>>>> Thanks anyway for the info.


-- 
~Randy
