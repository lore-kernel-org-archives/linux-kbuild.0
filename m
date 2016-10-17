Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:34982 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932221AbcJQUn1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Oct 2016 16:43:27 -0400
MIME-Version: 1.0
In-Reply-To: <5d04ac9f-8cf5-3f1a-4943-16dbfd24f0fc@infradead.org>
References: <CALyZvKyveULRX56yZz1nx96ZjDoo3JKPAFqj=29p++nx=sGHVw@mail.gmail.com>
 <3077d5cb-9a8a-5d3e-cd00-ce3ad5cb3406@infradead.org> <CALyZvKwe+NmGn=3NY=TMBtPHGYgt2KTP0G9OjO6w_gG=VDLUrg@mail.gmail.com>
 <5d04ac9f-8cf5-3f1a-4943-16dbfd24f0fc@infradead.org>
From: Boris Barbulovski <bbarbulovski@gmail.com>
Date: Mon, 17 Oct 2016 22:43:24 +0200
Message-ID: <CAOfo6n-R_jqYroeXb6_i+80XRe77sm1sagrNV09LB79_hSuB-w@mail.gmail.com>
Subject: Re: please, where has xconfig KConf option documentation gone with
 linux 4.8's Qt5 / Qt4 xconfig ?
Content-Type: multipart/mixed; boundary=001a11403de2a22c39053f15a0f3
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

--001a11403de2a22c39053f15a0f3
Content-Type: text/plain; charset=UTF-8

can you try this patch?



On Mon, Oct 17, 2016 at 7:28 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> Boris or Thiago,
>
> Any comments, suggestions, or patches about this?
>
> thanks.
>
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
>>>
>>> --
>>> ~Randy
>
>
> --
> ~Randy



-- 
Boris Barbulovski
http://mkfusion.bokicsoft.com/

--001a11403de2a22c39053f15a0f3
Content-Type: text/x-patch; charset=US-ASCII; name="QSlider_sizes_issues.patch"
Content-Disposition: attachment; filename="QSlider_sizes_issues.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iuej2eu90

RnJvbSA3NTM1MGZhM2VjMWRkOTI1YTMwYjI1MTE4OTIxMjhhMDdjYmUxMGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCb3JpcyBCYXJidWxvdnNraSA8YmJhcmJ1bG92c2tpQGdtYWls
LmNvbT4KRGF0ZTogTW9uLCAxNyBPY3QgMjAxNiAyMjoyMzoxNCArMDIwMApTdWJqZWN0OiBbUEFU
Q0hdIHFjb25maWcgaW5pdGlhbCBzbGlkZXIgc2l6ZXMgZml4LgoKT24gZmlyc3QgYG1ha2UgeGNv
bmZpZ2AsIHN1Ym9wdGlvbiBhbmQgaGVscCBwYW5lbHMgd2VyZSBoaWRkZW4uCk5vdyB3ZSBwcm9w
ZXJseSBkZXRlY3QgdGhlIGZpcnN0IHJ1biwgYW5kIHNob3cgdGhvc2UgcGFuZWxzLgoKU2lnbmVk
LW9mZi1ieTogQm9yaXMgQmFyYnVsb3Zza2kgPGJiYXJidWxvdnNraUBnbWFpbC5jb20+Ci0tLQog
c2NyaXB0cy9rY29uZmlnL3Fjb25mLmNjIHwgMTYgKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2Ny
aXB0cy9rY29uZmlnL3Fjb25mLmNjIGIvc2NyaXB0cy9rY29uZmlnL3Fjb25mLmNjCmluZGV4IGZj
NTU1NTkuLmU5OWMwNGYgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMva2NvbmZpZy9xY29uZi5jYworKysg
Yi9zY3JpcHRzL2tjb25maWcvcWNvbmYuY2MKQEAgLTY1LDExICs2NSwxOSBAQCBDb25maWdTZXR0
aW5nczo6Q29uZmlnU2V0dGluZ3MoKQogUUxpc3Q8aW50PiBDb25maWdTZXR0aW5nczo6cmVhZFNp
emVzKGNvbnN0IFFTdHJpbmcmIGtleSwgYm9vbCAqb2spCiB7CiAJUUxpc3Q8aW50PiByZXN1bHQ7
Ci0JUVN0cmluZ0xpc3QgZW50cnlMaXN0ID0gdmFsdWUoa2V5KS50b1N0cmluZ0xpc3QoKTsKLQlR
U3RyaW5nTGlzdDo6SXRlcmF0b3IgaXQ7CiAKLQlmb3IgKGl0ID0gZW50cnlMaXN0LmJlZ2luKCk7
IGl0ICE9IGVudHJ5TGlzdC5lbmQoKTsgKytpdCkKLQkJcmVzdWx0LnB1c2hfYmFjaygoKml0KS50
b0ludCgpKTsKKwlpZiAoY29udGFpbnMoa2V5KSkKKwl7CisJCVFTdHJpbmdMaXN0IGVudHJ5TGlz
dCA9IHZhbHVlKGtleSkudG9TdHJpbmdMaXN0KCk7CisJCVFTdHJpbmdMaXN0OjpJdGVyYXRvciBp
dDsKKworCQlmb3IgKGl0ID0gZW50cnlMaXN0LmJlZ2luKCk7IGl0ICE9IGVudHJ5TGlzdC5lbmQo
KTsgKytpdCkKKwkJCXJlc3VsdC5wdXNoX2JhY2soKCppdCkudG9JbnQoKSk7CisKKwkJKm9rID0g
dHJ1ZTsKKwl9CisJZWxzZQorCQkqb2sgPSBmYWxzZTsKIAogCXJldHVybiByZXN1bHQ7CiB9Ci0t
IAoyLjcuNAoK
--001a11403de2a22c39053f15a0f3--
