Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:54154 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755467AbcJXBRs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Oct 2016 21:17:48 -0400
Subject: Re: please, where has xconfig KConf option documentation gone with
 linux 4.8's Qt5 / Qt4 xconfig ?
References: <CALyZvKyveULRX56yZz1nx96ZjDoo3JKPAFqj=29p++nx=sGHVw@mail.gmail.com>
 <3077d5cb-9a8a-5d3e-cd00-ce3ad5cb3406@infradead.org>
 <CALyZvKwe+NmGn=3NY=TMBtPHGYgt2KTP0G9OjO6w_gG=VDLUrg@mail.gmail.com>
 <5d04ac9f-8cf5-3f1a-4943-16dbfd24f0fc@infradead.org>
 <CAOfo6n-R_jqYroeXb6_i+80XRe77sm1sagrNV09LB79_hSuB-w@mail.gmail.com>
 <CAOfo6n_2PsydnZUGHzoPDcfL2o86XSHiGUUt1aoLvPkfj3hR-w@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7029e33a-98e2-212f-c6a5-f4748d5cd12c@infradead.org>
Date: Sun, 23 Oct 2016 18:17:44 -0700
MIME-Version: 1.0
In-Reply-To: <CAOfo6n_2PsydnZUGHzoPDcfL2o86XSHiGUUt1aoLvPkfj3hR-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Boris Barbulovski <bbarbulovski@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On 10/17/16 13:50, Boris Barbulovski wrote:
> And make sure to delete ~/.config/kernel.org/qconf.conf file before
> testing because it might have some illegal settings that might trigger
> the same issue again.
> 

I tested it and it seems to do the right thing.
Tested-by: Randy Dunlap <rdunlap@infradead.org>

If this patch isn't already in the linux-kconfig tree, please add it for more testing.

> 
> On Mon, Oct 17, 2016 at 10:43 PM, Boris Barbulovski
> <bbarbulovski@gmail.com> wrote:
>> can you try this patch?
>>
>>
>>
>> On Mon, Oct 17, 2016 at 7:28 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
>>> Boris or Thiago,
>>>
>>> Any comments, suggestions, or patches about this?
>>>
>>> thanks.
>>>
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
>>>>
>>>> Regards,
>>>> Jason
>>>>
>>>>
>>>>
>>>>
>>>> On 11/10/2016, Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>> [changed linux-config to linux-kbuild list]
>>>>>
>>>>> On 10/09/16 13:46, Jason Vas Dias wrote:
>>>>>> Hi -
>>>>>> I've been doing 'make xconfig'  to configure the kernel for many years
>>>>>> now, and
>>>>>> always there used to be some option documentation pane populated with
>>>>>> summary documentation for the specific option selected .
>>>>>> But now,  when built for Qt 5.7.0, (also tried Qt 4.8 and GTK) there
>>>>>> is no option
>>>>>> documentation pane - this is a real pain !  The option documentation also
>>>>>> is not displayed with any other gui, eg.  'make menuconfig' / 'make
>>>>>> gtkconfig' -
>>>>>> I'm sure it used to be . This is a regression IMHO .
>>>>>> How can I restore display of documentation for each selected option ?
>>>>>> Will older xconfig work for Linux 4.8 ? it appears not ...
>>>>>> Thanks in advance for any replies,
>>>>>> Jason
>>>>>
>>>>> That's odd. I see the help info in all of xconfig, gconfig, menuconfig, &
>>>>> nconfig.
>>>>>
>>>>> In xconfig, if the right hand side of the config window only lists some
>>>>> kernel config
>>>>> options and no symbol help/info, the symbol info portion may be hidden. Try
>>>>> pointing
>>>>> to the bottom of the right side of the window and hold down the left mouse
>>>>> button
>>>>> and then drag the mouse pointer upward to open the symbol info pane.
>>>>> At least that is what works for me.
>>>>>
>>>>> --
>>>>> ~Randy
>>>
>>>
>>> --
>>> ~Randy
>>
>>
>>
>> --
>> Boris Barbulovski
>> http://mkfusion.bokicsoft.com/


-- 
~Randy
