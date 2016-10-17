Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34037 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932163AbcJQWcb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Oct 2016 18:32:31 -0400
Subject: Re: please, where has xconfig KConf option documentation gone with
 linux 4.8's Qt5 / Qt4 xconfig ?
References: <CALyZvKyveULRX56yZz1nx96ZjDoo3JKPAFqj=29p++nx=sGHVw@mail.gmail.com>
 <3077d5cb-9a8a-5d3e-cd00-ce3ad5cb3406@infradead.org>
 <CALyZvKwe+NmGn=3NY=TMBtPHGYgt2KTP0G9OjO6w_gG=VDLUrg@mail.gmail.com>
 <5d04ac9f-8cf5-3f1a-4943-16dbfd24f0fc@infradead.org>
 <CAOfo6n-R_jqYroeXb6_i+80XRe77sm1sagrNV09LB79_hSuB-w@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f1b0e081-100a-278f-3d79-836501c6895c@infradead.org>
Date: Mon, 17 Oct 2016 15:32:30 -0700
MIME-Version: 1.0
In-Reply-To: <CAOfo6n-R_jqYroeXb6_i+80XRe77sm1sagrNV09LB79_hSuB-w@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------018C795E7C20F82C2B5A1CF6"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Boris Barbulovski <bbarbulovski@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Jason Vas Dias <jason.vas.dias@gmail.com>

This is a multi-part message in MIME format.
--------------018C795E7C20F82C2B5A1CF6
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

[adding Jason for testing]

On 10/17/16 13:43, Boris Barbulovski wrote:
> can you try this patch?
> 

And make sure to delete ~/.config/kernel.org/qconf.conf file before
testing because it might have some illegal settings that might trigger
the same issue again.

[patch is attached]

> 
> 
> On Mon, Oct 17, 2016 at 7:28 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
>> Boris or Thiago,
>>
>> Any comments, suggestions, or patches about this?
>>
>> thanks.
>>
>> On 10/15/16 04:09, Jason Vas Dias wrote:
>>>  Aha, thanks! I never would have known this without being told -
>>>  there is no visible indication that the symbol info pane exists
>>>  at all until one tries to drag the lower right corner of the window
>>>  notth-eastwards - is this meant to be somehow an intuitive thing to
>>>  do these days to view more info ?
>>>
>>>  I did manage to view the option documentation with nconfig  /
>>>  using emacs to view the KConf files (preferable).
>>>
>>>  Really, it would be nice if xconfig had some 'View' Menu & one could select
>>>  View -> Option Documentation  or press <F1> over an option to view the
>>>  documentation for it , and if the geometry of the different panes was
>>> correct at
>>>  startup .- the whole Option value pane initially appears on the far right hand
>>>  side, about 10 pixels wide , until resized ; and there really is no sign of the
>>>  documentation pane at all until lower right-hand corner dragged.
>>>
>>>  Also, in the Help -> Introduction panel, it says :
>>>    "Toggling Show Debug Info under the Options menu will show the
>>> dependencies..."
>>>  but there is no "Show Debug Info" option on the Options menu - sounds like
>>>  it might be a useful feature - should I be seeing a "Show Debug Info" option ?
>>>  why don't I see one ?  Maybe the Options menu might be a good place to put
>>>  an "Expand Option Documentation Pane" option ?
>>>
>>> Thanks anyway for the info.
>>>
>>> Regards,
>>> Jason
>>>
>>>
>>>
>>>
>>> On 11/10/2016, Randy Dunlap <rdunlap@infradead.org> wrote:
>>>> [changed linux-config to linux-kbuild list]
>>>>
>>>> On 10/09/16 13:46, Jason Vas Dias wrote:
>>>>> Hi -
>>>>> I've been doing 'make xconfig'  to configure the kernel for many years
>>>>> now, and
>>>>> always there used to be some option documentation pane populated with
>>>>> summary documentation for the specific option selected .
>>>>> But now,  when built for Qt 5.7.0, (also tried Qt 4.8 and GTK) there
>>>>> is no option
>>>>> documentation pane - this is a real pain !  The option documentation also
>>>>> is not displayed with any other gui, eg.  'make menuconfig' / 'make
>>>>> gtkconfig' -
>>>>> I'm sure it used to be . This is a regression IMHO .
>>>>> How can I restore display of documentation for each selected option ?
>>>>> Will older xconfig work for Linux 4.8 ? it appears not ...
>>>>> Thanks in advance for any replies,
>>>>> Jason
>>>>
>>>> That's odd. I see the help info in all of xconfig, gconfig, menuconfig, &
>>>> nconfig.
>>>>
>>>> In xconfig, if the right hand side of the config window only lists some
>>>> kernel config
>>>> options and no symbol help/info, the symbol info portion may be hidden. Try
>>>> pointing
>>>> to the bottom of the right side of the window and hold down the left mouse
>>>> button
>>>> and then drag the mouse pointer upward to open the symbol info pane.
>>>> At least that is what works for me.
>>>>
>>>> --
>>>> ~Randy
>>
>>
>> --
>> ~Randy
> 
> 
> 


-- 
~Randy

--------------018C795E7C20F82C2B5A1CF6
Content-Type: text/x-patch;
 name="QSlider_sizes_issues.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="QSlider_sizes_issues.patch"

From 75350fa3ec1dd925a30b2511892128a07cbe10de Mon Sep 17 00:00:00 2001
From: Boris Barbulovski <bbarbulovski@gmail.com>
Date: Mon, 17 Oct 2016 22:23:14 +0200
Subject: [PATCH] qconfig initial slider sizes fix.

On first `make xconfig`, suboption and help panels were hidden.
Now we properly detect the first run, and show those panels.

Signed-off-by: Boris Barbulovski <bbarbulovski@gmail.com>
---
 scripts/kconfig/qconf.cc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index fc55559..e99c04f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -65,11 +65,19 @@ ConfigSettings::ConfigSettings()
 QList<int> ConfigSettings::readSizes(const QString& key, bool *ok)
 {
 	QList<int> result;
-	QStringList entryList = value(key).toStringList();
-	QStringList::Iterator it;
 
-	for (it = entryList.begin(); it != entryList.end(); ++it)
-		result.push_back((*it).toInt());
+	if (contains(key))
+	{
+		QStringList entryList = value(key).toStringList();
+		QStringList::Iterator it;
+
+		for (it = entryList.begin(); it != entryList.end(); ++it)
+			result.push_back((*it).toInt());
+
+		*ok = true;
+	}
+	else
+		*ok = false;
 
 	return result;
 }
-- 
2.7.4


--------------018C795E7C20F82C2B5A1CF6--
