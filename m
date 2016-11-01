Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:54422 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965307AbcKACrR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Oct 2016 22:47:17 -0400
Subject: Re: please, where has xconfig KConf option documentation gone with
 linux 4.8's Qt5 / Qt4 xconfig ?
References: <CALyZvKyveULRX56yZz1nx96ZjDoo3JKPAFqj=29p++nx=sGHVw@mail.gmail.com>
 <3077d5cb-9a8a-5d3e-cd00-ce3ad5cb3406@infradead.org>
 <CALyZvKwe+NmGn=3NY=TMBtPHGYgt2KTP0G9OjO6w_gG=VDLUrg@mail.gmail.com>
 <5d04ac9f-8cf5-3f1a-4943-16dbfd24f0fc@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f1c8288a-7a28-da2b-1b4a-699d2effa223@infradead.org>
Date: Mon, 31 Oct 2016 19:47:08 -0700
MIME-Version: 1.0
In-Reply-To: <5d04ac9f-8cf5-3f1a-4943-16dbfd24f0fc@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Vas Dias <jason.vas.dias@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Boris Barbulovski <bbarbulovski@gmail.com>, Thiago Macieira <thiago.macieira@intel.com>, Michal Marek <mmarek@suse.cz>

On 10/17/16 10:28, Randy Dunlap wrote:
> Boris or Thiago,
> 
> Any comments, suggestions, or patches about this?
> 
> thanks.

Hi Boris and Thiago,

Other than you patch of Oct. 17 (which needs to be added to linux-kconfig for
linux-next testing), the OP (Jason) mentioned that the xconfig "Help, Introduction"
mentions a toggle called "Show Debug Info" but there is no such option under
the Option menu.

The qconf.cc source file does contain a boolean called _showDebug. How is it
used?  It appears to only be settable by editing the .config/kernel.org/qconf.conf
file:
qconf\help\showDebug=false
and changing that 'false' to 'true'. Doing that still does not show any debug options
in the xconfig windows. What it appears to do is to highlight (via html) the kconfig
keywords so that the user can click on them, but when I do that, nothing useful
happens (they just disappear!).

So the questions are basically:

1. should be Help/Introduction text be cleaned up so that it does not refer to
Show Debug Options? or should that toggle be reinstated?

2. how is /showDebug used? should it be documented? should it be fixed?
should it be deleted?

Thanks.

> On 10/15/16 04:09, Jason Vas Dias wrote:
>>  Aha, thanks! I never would have known this without being told -
>>  there is no visible indication that the symbol info pane exists
>>  at all until one tries to drag the lower right corner of the window
>>  notth-eastwards - is this meant to be somehow an intuitive thing to
>>  do these days to view more info ?
>>
>>  I did manage to view the option documentation with nconfig  /
>>  using emacs to view the KConf files (preferable).
>>
>>  Really, it would be nice if xconfig had some 'View' Menu & one could select
>>  View -> Option Documentation  or press <F1> over an option to view the
>>  documentation for it , and if the geometry of the different panes was
>> correct at
>>  startup .- the whole Option value pane initially appears on the far right hand
>>  side, about 10 pixels wide , until resized ; and there really is no sign of the
>>  documentation pane at all until lower right-hand corner dragged.
>>
>>  Also, in the Help -> Introduction panel, it says :
>>    "Toggling Show Debug Info under the Options menu will show the
>> dependencies..."
>>  but there is no "Show Debug Info" option on the Options menu - sounds like
>>  it might be a useful feature - should I be seeing a "Show Debug Info" option ?
>>  why don't I see one ?  Maybe the Options menu might be a good place to put
>>  an "Expand Option Documentation Pane" option ?
>>
>> Thanks anyway for the info.
>>
>> Regards,
>> Jason
>>
>>
>>
>>
>> On 11/10/2016, Randy Dunlap <rdunlap@infradead.org> wrote:
>>> [changed linux-config to linux-kbuild list]
>>>
>>> On 10/09/16 13:46, Jason Vas Dias wrote:
>>>> Hi -
>>>> I've been doing 'make xconfig'  to configure the kernel for many years
>>>> now, and
>>>> always there used to be some option documentation pane populated with
>>>> summary documentation for the specific option selected .
>>>> But now,  when built for Qt 5.7.0, (also tried Qt 4.8 and GTK) there
>>>> is no option
>>>> documentation pane - this is a real pain !  The option documentation also
>>>> is not displayed with any other gui, eg.  'make menuconfig' / 'make
>>>> gtkconfig' -
>>>> I'm sure it used to be . This is a regression IMHO .
>>>> How can I restore display of documentation for each selected option ?
>>>> Will older xconfig work for Linux 4.8 ? it appears not ...
>>>> Thanks in advance for any replies,
>>>> Jason
>>>
>>> That's odd. I see the help info in all of xconfig, gconfig, menuconfig, &
>>> nconfig.
>>>
>>> In xconfig, if the right hand side of the config window only lists some
>>> kernel config
>>> options and no symbol help/info, the symbol info portion may be hidden. Try
>>> pointing
>>> to the bottom of the right side of the window and hold down the left mouse
>>> button
>>> and then drag the mouse pointer upward to open the symbol info pane.
>>> At least that is what works for me.


-- 
~Randy
