Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.fiord.ru ([62.140.247.50]:38940 "EHLO mail.fiord.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754288AbdERMry (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 May 2017 08:47:54 -0400
Subject: Re: [GIT] [PATCH 1/1] kbuild: Add wrapping of long expressions at ORs
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_2920762f1d92d02bb69af2dac1a7a365"
Date: Thu, 18 May 2017 15:47:49 +0300
From: Alexander Amelkin <alexander@amelkin.msk.ru>
In-Reply-To: <8d594e38-cad1-d977-718b-22f998a58129@infradead.org>
References: <2b001634fc74aaabc1ab988ffb1d388b@amelkin.online>
 <8d594e38-cad1-d977-718b-22f998a58129@infradead.org>
Message-ID: <ea2d5e7ef1c2ce3868148bf3b3775694@amelkin.msk.ru>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Andrew Morton <akpm@linux-foundation.org>

--=_2920762f1d92d02bb69af2dac1a7a365
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed

Randy, thank you for testing the patch.

I'm sorry about the patch content corrupted by the web client.
This is my first attempt to contribute to Linux kernel, so I was just 
trying to
follow the Documentation/process/submitting-patches.txt item 6:

"6) No MIME, no links, no compression, no attachments. Just plain text"

I'm attaching the patch now. Since I'm mostly using the web client, I 
will next time
both attach the file, and paste the plain text.

Please check the attachment now and let me know if it applies cleanly 
for you.

With best regards,
Alexander.
http://www.linkedin.com/in/aamelkin

Randy Dunlap писал 2017-05-16 01:16:

> On 05/10/17 06:06, Alexander Amelkin wrote:
>> The following changes since commit 
>> a351e9b9fc24e982ec2f0e76379a49826036da12:
>> 
>>   Linux 4.11 (2017-04-30 19:47:48 -0700)
>> 
>> are available in the git repository at:
>> 
>>   https://github.com/AlexanderAmelkin/linux-wandboard.git 
>> tags/kconfig_wrapping
>> 
>> for you to fetch changes up to 
>> f4c95059bd2410ac96d6ef9f8848a0f0b757a17a:
>> 
>>   kconfig: Add wrapping of long expressions at ORs (2017-05-10 
>> 12:51:31 +0300)
> 
> Once again I don't know who is going to merge this patch.  Andrew?
> 
> 
>> ----------------------------------------------------------------
>> Some symbols in configuration may be selected by very-very long 
>> boolean
>> expressions. Reading through such long expressions, it is extremely 
>> hard
>> to identify what exactly selects the given option.
>> 
>> This commit adds a new line every time a boolean OR is encountered in
>> the "outer" expression. That is, it won't break apart separate
>> sub-expressions like OPTION_A && (OPTION_B || OPTION_C), but will add 
>> a
>> new line before OPTION_C in an expression like:
>> 
>> OPTION_A && OPTION_B || OPTION_C && OPTION_D
>> 
>> This commit also adds indentation of the wrapped lines to the label
>> position. That is, the expression on the new line will continue 
>> starting
>> at the same character position as it started in the first line, right
>> after the label such as "  Selected by:  ".
>> 
>> This commit also renames some variables to better reflect their 
>> purpose.
>> 
>> Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> Cc: linux-kbuild@vger.kernel.org
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> I guess that your webmail client modified all of the tabs in the source
> code into spaces... which wouldn't happen if I did a git clone, but
> I'm not doing that.  Perhaps you could attach a copy of the patch that
> contains tabs instead of spaces.  I had to edit the patch quite a bit
> and then tell 'patch' to ignore whitespace issues.
> 
> Thanks.
> 
>> ----------------------------------------------------------------
>> Alexander Amelkin (1):
>>       kconfig: Add wrapping of long expressions at ORs
>> 
>>  scripts/kconfig/expr.c | 48 
>> ++++++++++++++++++++++++++++++++++++++++--------
>>  scripts/kconfig/lkc.h  | 15 ++++++++++++---
>>  scripts/kconfig/menu.c | 16 +++++++++++++---
>>  scripts/kconfig/util.c |  1 +
>>  4 files changed, 66 insertions(+), 14 deletions(-)

--=_2920762f1d92d02bb69af2dac1a7a365
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=0001-kconfig-Add-wrapping-of-long-expressions-at-ORs.patch
Content-Disposition: attachment;
 filename=0001-kconfig-Add-wrapping-of-long-expressions-at-ORs.patch;
 size=6360

RnJvbSBmNGM5NTA1OWJkMjQxMGFjOTZkNmVmOWY4ODQ4YTBmMGI3NTdhMTdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kZXIgQW1lbGtpbiA8YWxleGFuZGVyQGFtZWxraW4u
bXNrLnJ1PgpEYXRlOiBNb24sIDcgTm92IDIwMTYgMTM6NDg6MTkgKzAzMDAKU3ViamVjdDogW1BB
VENIXSBrY29uZmlnOiBBZGQgd3JhcHBpbmcgb2YgbG9uZyBleHByZXNzaW9ucyBhdCBPUnMKClNv
bWUgc3ltYm9scyBpbiBjb25maWd1cmF0aW9uIG1heSBiZSBzZWxlY3RlZCBieSB2ZXJ5LXZlcnkg
bG9uZyBib29sZWFuCmV4cHJlc3Npb25zLiBSZWFkaW5nIHRocm91Z2ggc3VjaCBsb25nIGV4cHJl
c3Npb25zLCBpdCBpcyBleHRyZW1lbHkgaGFyZAp0byBpZGVudGlmeSB3aGF0IGV4YWN0bHkgc2Vs
ZWN0cyB0aGUgZ2l2ZW4gb3B0aW9uLgoKVGhpcyBjb21taXQgYWRkcyBhIG5ldyBsaW5lIGV2ZXJ5
IHRpbWUgYSBib29sZWFuIE9SIGlzIGVuY291bnRlcmVkIGluCnRoZSAib3V0ZXIiIGV4cHJlc3Np
b24uIFRoYXQgaXMsIGl0IHdvbid0IGJyZWFrIGFwYXJ0IHNlcGFyYXRlCnN1Yi1leHByZXNzaW9u
cyBsaWtlIE9QVElPTl9BICYmIChPUFRJT05fQiB8fCBPUFRJT05fQyksIGJ1dCB3aWxsIGFkZCBh
Cm5ldyBsaW5lIGJlZm9yZSBPUFRJT05fQyBpbiBhbiBleHByZXNzaW9uIGxpa2U6CgpPUFRJT05f
QSAmJiBPUFRJT05fQiB8fCBPUFRJT05fQyAmJiBPUFRJT05fRAoKVGhpcyBjb21taXQgYWxzbyBh
ZGRzIGluZGVudGF0aW9uIG9mIHRoZSB3cmFwcGVkIGxpbmVzIHRvIHRoZSBsYWJlbApwb3NpdGlv
bi4gVGhhdCBpcywgdGhlIGV4cHJlc3Npb24gb24gdGhlIG5ldyBsaW5lIHdpbGwgY29udGludWUg
c3RhcnRpbmcKYXQgdGhlIHNhbWUgY2hhcmFjdGVyIHBvc2l0aW9uIGFzIGl0IHN0YXJ0ZWQgaW4g
dGhlIGZpcnN0IGxpbmUsIHJpZ2h0CmFmdGVyIHRoZSBsYWJlbCBzdWNoIGFzICIgIFNlbGVjdGVk
IGJ5OiAgIi4KClRoaXMgY29tbWl0IGFsc28gcmVuYW1lcyBzb21lIHZhcmlhYmxlcyB0byBiZXR0
ZXIgcmVmbGVjdCB0aGVpciBwdXJwb3NlLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEFtZWxr
aW4gPGFsZXhhbmRlckBhbWVsa2luLm1zay5ydT4KQ2M6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPgpDYzogbGludXgta2J1aWxkQHZnZXIua2VybmVsLm9yZwotLS0KIHNj
cmlwdHMva2NvbmZpZy9leHByLmMgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0KIHNjcmlwdHMva2NvbmZpZy9sa2MuaCAgfCAxNSArKysrKysrKysr
KystLS0KIHNjcmlwdHMva2NvbmZpZy9tZW51LmMgfCAxNiArKysrKysrKysrKysrLS0tCiBzY3Jp
cHRzL2tjb25maWcvdXRpbC5jIHwgIDEgKwogNCBmaWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25z
KCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2tjb25maWcvZXhwci5j
IGIvc2NyaXB0cy9rY29uZmlnL2V4cHIuYwppbmRleCBjYmY0OTk2Li5iMGQ5NzY1IDEwMDY0NAot
LS0gYS9zY3JpcHRzL2tjb25maWcvZXhwci5jCisrKyBiL3NjcmlwdHMva2NvbmZpZy9leHByLmMK
QEAgLTExNzAsNiArMTE3MCwyNyBAQCB2b2lkIGV4cHJfZnByaW50KHN0cnVjdCBleHByICplLCBG
SUxFICpvdXQpCiAJZXhwcl9wcmludChlLCBleHByX3ByaW50X2ZpbGVfaGVscGVyLCBvdXQsIEVf
Tk9ORSk7CiB9CiAKK3N0YXRpYyBpbnQgc3RyX2NocmNvdW50KGNvbnN0IGNoYXIgKnMsIGNoYXIg
YykKK3sKKwlpbnQgY291bnQgPSAwOworCWNvbnN0IGNoYXIgKnAgPSBzOworCisJd2hpbGUgKE5V
TEwgIT0gKHAgPSBzdHJjaHIocCwgYykpKSB7CisJCXArKzsKKwkJY291bnQrKzsKKwl9CisJcmV0
dXJuIGNvdW50OworfQorCitzdGF0aWMgdm9pZCBzdHJfbmV3bGluZV9pbmRlbnRlZChzdHJ1Y3Qg
Z3N0ciAqZ3MpCit7CisJaW50IGk7CisKKwlzdHJfYXBwZW5kKGdzLCAiXFxcbiIpOworCWZvciAo
aSA9IDA7IGkgPCBncy0+bGFiZWxfbGVuOyBpKyspCisJCXN0cl9hcHBlbmQoZ3MsICIgIik7Cit9
CisKIHN0YXRpYyB2b2lkIGV4cHJfcHJpbnRfZ3N0cl9oZWxwZXIodm9pZCAqZGF0YSwgc3RydWN0
IHN5bWJvbCAqc3ltLCBjb25zdCBjaGFyICpzdHIpCiB7CiAJc3RydWN0IGdzdHIgKmdzID0gKHN0
cnVjdCBnc3RyKilkYXRhOwpAQCAtMTE3OSwyNSArMTIwMCwzNiBAQCBzdGF0aWMgdm9pZCBleHBy
X3ByaW50X2dzdHJfaGVscGVyKHZvaWQgKmRhdGEsIHN0cnVjdCBzeW1ib2wgKnN5bSwgY29uc3Qg
Y2hhciAqcwogCQlzeW1fc3RyID0gc3ltX2dldF9zdHJpbmdfdmFsdWUoc3ltKTsKIAogCWlmIChn
cy0+bWF4X3dpZHRoKSB7Ci0JCXVuc2lnbmVkIGV4dHJhX2xlbmd0aCA9IHN0cmxlbihzdHIpOwor
CQl1bnNpZ25lZCBpbnQgYWRkZWRfbGVuZ3RoID0gc3RybGVuKHN0cik7CiAJCWNvbnN0IGNoYXIg
Kmxhc3RfY3IgPSBzdHJyY2hyKGdzLT5zLCAnXG4nKTsKLQkJdW5zaWduZWQgbGFzdF9saW5lX2xl
bmd0aDsKKwkJdW5zaWduZWQgaW50IHRoaXNfbGluZV9sZW5ndGg7CiAKIAkJaWYgKHN5bV9zdHIp
Ci0JCQlleHRyYV9sZW5ndGggKz0gNCArIHN0cmxlbihzeW1fc3RyKTsKKwkJCWFkZGVkX2xlbmd0
aCArPSA0ICsgc3RybGVuKHN5bV9zdHIpOwogCiAJCWlmICghbGFzdF9jcikKLQkJCWxhc3RfY3Ig
PSBncy0+czsKLQotCQlsYXN0X2xpbmVfbGVuZ3RoID0gc3RybGVuKGdzLT5zKSAtIChsYXN0X2Ny
IC0gZ3MtPnMpOworCQkJLyogQWNjb3VudCBmb3IgdGhlIGxhYmVsIG5vdCBpbmNsdWRlZCBpbiB0
aGUgZmlyc3QgbGluZSAqLworCQkJdGhpc19saW5lX2xlbmd0aCA9IHN0cmxlbihncy0+cykgKyBn
cy0+bGFiZWxfbGVuOworCQllbHNlCisJCQkvKiBTdWJzZXF1ZW50IGxpbmVzIGFscmVhZHkgY29u
dGFpbiB0aGUgaW5kZW50IGluc2lkZSB0aGVtICovCisJCQl0aGlzX2xpbmVfbGVuZ3RoID0gc3Ry
bGVuKGxhc3RfY3IgKyAxKTsKIAotCQlpZiAoKGxhc3RfbGluZV9sZW5ndGggKyBleHRyYV9sZW5n
dGgpID4gZ3MtPm1heF93aWR0aCkKLQkJCXN0cl9hcHBlbmQoZ3MsICJcXFxuIik7CisJCWlmICgo
dGhpc19saW5lX2xlbmd0aCArIGFkZGVkX2xlbmd0aCkgPiBncy0+bWF4X3dpZHRoKQorCQkJc3Ry
X25ld2xpbmVfaW5kZW50ZWQoZ3MpOwogCX0KIAogCXN0cl9hcHBlbmQoZ3MsIHN0cik7CiAJaWYg
KHN5bSAmJiBzeW0tPnR5cGUgIT0gU19VTktOT1dOKQogCQlzdHJfcHJpbnRmKGdzLCAiIFs9JXNd
Iiwgc3ltX3N0cik7CisKKwkvKiBCcmVhayB0aGUgbGluZSBvbiBhbiBPUiBmb3IgJ291dGVyJyBl
eHByZXNzaW9ucywKKwkgICBkb24ndCBicmVhayBpbnNpZGUgcGFyZW50aGVzZXMuICovCisJaWYg
KHN0cl9jaHJjb3VudChncy0+cywgJygnKSA9PSBzdHJfY2hyY291bnQoZ3MtPnMsICcpJykpIHsK
KwkJaW50IGxlbiA9IHN0cmxlbihzdHIpOworCisJCWlmIChsZW4gPj0gNCAmJiAhc3RyY21wKHN0
ciArIGxlbiAtIDQsICIgfHwgIikpCisJCQlzdHJfbmV3bGluZV9pbmRlbnRlZChncyk7CisJfQog
fQogCiB2b2lkIGV4cHJfZ3N0cl9wcmludChzdHJ1Y3QgZXhwciAqZSwgc3RydWN0IGdzdHIgKmdz
KQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9rY29uZmlnL2xrYy5oIGIvc2NyaXB0cy9rY29uZmlnL2xr
Yy5oCmluZGV4IDkxY2ExMjYuLjJiZjY3MDQgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMva2NvbmZpZy9s
a2MuaAorKysgYi9zY3JpcHRzL2tjb25maWcvbGtjLmgKQEAgLTEyMCwxMCArMTIwLDE5IEBAIHN0
cnVjdCBnc3RyIHsKIAlzaXplX3QgbGVuOwogCWNoYXIgICpzOwogCS8qCi0JKiB3aGVuIG1heF93
aWR0aCBpcyBub3QgemVybyBsb25nIGxpbmVzIGluIHN0cmluZyBzIChpZiBhbnkpIGdldAotCSog
d3JhcHBlZCBub3QgdG8gZXhjZWVkIHRoZSBtYXhfd2lkdGggdmFsdWUKLQkqLworCSAqIHdoZW4g
bWF4X3dpZHRoIGlzIG5vdCB6ZXJvIGxvbmcgbGluZXMgaW4gc3RyaW5nIHMgKGlmIGFueSkgZ2V0
CisJICogd3JhcHBlZCBub3QgdG8gZXhjZWVkIHRoZSBtYXhfd2lkdGggdmFsdWUKKwkgKi8KIAlp
bnQgbWF4X3dpZHRoOworCS8qCisJICogVGhlIGxhYmVsIGZvciB0aGUgc3RyaW5nLiBVc3VhbGx5
IHRoZSBzdHJpbmcgaXMgb3V0cHV0IHRvIHRoZSByaWdodAorCSAqIGZyb20gdGhlIGxhYmVsIGlu
IHRoZSBzYW1lIGxpbmUuIFRoZSBsYWJlbF9sZW4gaXMgdXNlZCB0byBpbmRlbnQKKwkgKiBsaW5l
cyB3aGVuIHRoZXkgYXJlIHRvbyBsb25nIGFuZCB3cmFwcGluZyBpcyByZXF1aXJlZC4KKwkgKgor
CSAqIFNldCB0aGlzIHByb3BlcnR5IGJlZm9yZSBjYWxsaW5nIGV4cHJfZ3N0cl9wcmludCgpIG9u
IGEgZ3N0ciBpZgorCSAqIGEgbG9uZyAod3JhcHBhYmxlKSBsaXN0IG9mIGV4cHJlc3Npb25zIGlz
IHBvc3NpYmxlLgorCSAqLworCWludCBsYWJlbF9sZW47CiB9Owogc3RydWN0IGdzdHIgc3RyX25l
dyh2b2lkKTsKIHZvaWQgc3RyX2ZyZWUoc3RydWN0IGdzdHIgKmdzKTsKZGlmZiAtLWdpdCBhL3Nj
cmlwdHMva2NvbmZpZy9tZW51LmMgYi9zY3JpcHRzL2tjb25maWcvbWVudS5jCmluZGV4IGU5MzU3
OTMuLjNhN2Q1YTYgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMva2NvbmZpZy9tZW51LmMKKysrIGIvc2Ny
aXB0cy9rY29uZmlnL21lbnUuYwpAQCAtNjI5LDYgKzYyOSw3IEBAIHN0YXRpYyB2b2lkIGdldF9z
eW1ib2xfcHJvcHNfc3RyKHN0cnVjdCBnc3RyICpyLCBzdHJ1Y3Qgc3ltYm9sICpzeW0sCiAJZm9y
X2FsbF9wcm9wZXJ0aWVzKHN5bSwgcHJvcCwgdG9rKSB7CiAJCWlmICghaGl0KSB7CiAJCQlzdHJf
YXBwZW5kKHIsIHByZWZpeCk7CisJCQlyLT5sYWJlbF9sZW4gPSBzdHJsZW4ocHJlZml4KTsKIAkJ
CWhpdCA9IHRydWU7CiAJCX0gZWxzZQogCQkJc3RyX3ByaW50ZihyLCAiICYmICIpOwpAQCAtNjY3
LDcgKzY2OCwxMCBAQCBzdGF0aWMgdm9pZCBnZXRfc3ltYm9sX3N0cihzdHJ1Y3QgZ3N0ciAqciwg
c3RydWN0IHN5bWJvbCAqc3ltLAogCQlzdHJfcHJpbnRmKHIsIF8oIiAgRGVmaW5lZCBhdCAlczol
ZFxuIiksIHByb3AtPm1lbnUtPmZpbGUtPm5hbWUsCiAJCQlwcm9wLT5tZW51LT5saW5lbm8pOwog
CQlpZiAoIWV4cHJfaXNfeWVzKHByb3AtPnZpc2libGUuZXhwcikpIHsKLQkJCXN0cl9hcHBlbmQo
ciwgXygiICBEZXBlbmRzIG9uOiAiKSk7CisJCQljb25zdCBjaGFyICpsYWJlbCA9IF8oIiAgRGVw
ZW5kcyBvbjogIik7CisKKwkJCXItPmxhYmVsX2xlbiA9IHN0cmxlbihsYWJlbCk7CisJCQlzdHJf
YXBwZW5kKHIsIGxhYmVsKTsKIAkJCWV4cHJfZ3N0cl9wcmludChwcm9wLT52aXNpYmxlLmV4cHIs
IHIpOwogCQkJc3RyX2FwcGVuZChyLCAiXG4iKTsKIAkJfQpAQCAtNjc1LDE0ICs2NzksMjAgQEAg
c3RhdGljIHZvaWQgZ2V0X3N5bWJvbF9zdHIoc3RydWN0IGdzdHIgKnIsIHN0cnVjdCBzeW1ib2wg
KnN5bSwKIAogCWdldF9zeW1ib2xfcHJvcHNfc3RyKHIsIHN5bSwgUF9TRUxFQ1QsIF8oIiAgU2Vs
ZWN0czogIikpOwogCWlmIChzeW0tPnJldl9kZXAuZXhwcikgewotCQlzdHJfYXBwZW5kKHIsIF8o
IiAgU2VsZWN0ZWQgYnk6ICIpKTsKKwkJY29uc3QgY2hhciAqbGFiZWwgPSBfKCIgIFNlbGVjdGVk
IGJ5OiAiKTsKKworCQlyLT5sYWJlbF9sZW4gPSBzdHJsZW4obGFiZWwpOworCQlzdHJfYXBwZW5k
KHIsIGxhYmVsKTsKIAkJZXhwcl9nc3RyX3ByaW50KHN5bS0+cmV2X2RlcC5leHByLCByKTsKIAkJ
c3RyX2FwcGVuZChyLCAiXG4iKTsKIAl9CiAKIAlnZXRfc3ltYm9sX3Byb3BzX3N0cihyLCBzeW0s
IFBfSU1QTFksIF8oIiAgSW1wbGllczogIikpOwogCWlmIChzeW0tPmltcGxpZWQuZXhwcikgewot
CQlzdHJfYXBwZW5kKHIsIF8oIiAgSW1wbGllZCBieTogIikpOworCQljb25zdCBjaGFyICpsYWJl
bCA9IF8oIiAgSW1wbGllZCBieTogIik7CisKKwkJci0+bGFiZWxfbGVuID0gc3RybGVuKGxhYmVs
KTsKKwkJc3RyX2FwcGVuZChyLCBsYWJlbCk7CiAJCWV4cHJfZ3N0cl9wcmludChzeW0tPmltcGxp
ZWQuZXhwciwgcik7CiAJCXN0cl9hcHBlbmQociwgIlxuIik7CiAJfQpkaWZmIC0tZ2l0IGEvc2Ny
aXB0cy9rY29uZmlnL3V0aWwuYyBiL3NjcmlwdHMva2NvbmZpZy91dGlsLmMKaW5kZXggMGU3NjA0
Mi4uNzlkZGJmOSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9rY29uZmlnL3V0aWwuYworKysgYi9zY3Jp
cHRzL2tjb25maWcvdXRpbC5jCkBAIC04NCw2ICs4NCw3IEBAIHN0cnVjdCBnc3RyIHN0cl9uZXco
dm9pZCkKIAlncy5zID0geG1hbGxvYyhzaXplb2YoY2hhcikgKiA2NCk7CiAJZ3MubGVuID0gNjQ7
CiAJZ3MubWF4X3dpZHRoID0gMDsKKwlncy5sYWJlbF9sZW4gPSAwOwogCXN0cmNweShncy5zLCAi
XDAiKTsKIAlyZXR1cm4gZ3M7CiB9Ci0tIAoyLjcuNAoK
--=_2920762f1d92d02bb69af2dac1a7a365--

