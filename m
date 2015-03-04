Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:36619 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758180AbbCDGo4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Mar 2015 01:44:56 -0500
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <20150206155009.GA23394@kroah.com>
References: <CA+icZUWoPxGgzgjiMEJ1PPXjRp_oa8_C0tceTyK4Ao6_Hco+Gw@mail.gmail.com>
	<20150206155009.GA23394@kroah.com>
Date: Wed, 4 Mar 2015 07:44:53 +0100
Message-ID: <CA+icZUX6nj7XuvAW=njpoX_ss5C5hbLmbqtvB=WFnh=ABgHiqw@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IGxpbnV4LTMuMTgueTogQWRkICJrY29uZmlnOiBGaXggd2FybmluZyAi4oCYanVtcA==?=
	=?UTF-8?B?4oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQiIg==?=
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: multipart/mixed; boundary=f46d044280c6f4388a051070c9ef
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Peter_K=C3=BCmmel?= <syntheticpp@gmx.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--f46d044280c6f4388a051070c9ef
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2015 at 4:50 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Feb 06, 2015 at 04:40:28PM +0100, Sedat Dilek wrote:
>> Hi,
>>
>> I see the following...
>>
>> $ yes "" | make oldconfig && make silentoldconfig </dev/null
>>   HOSTCC  scripts/basic/fixdep
>>   HOSTCC  scripts/kconfig/conf.o
>>   SHIPPED scripts/kconfig/zconf.tab.c
>>   SHIPPED scripts/kconfig/zconf.lex.c
>>   SHIPPED scripts/kconfig/zconf.hash.c
>>   HOSTCC  scripts/kconfig/zconf.tab.o
>> In file included from scripts/kconfig/zconf.tab.c:2537:0:
>> scripts/kconfig/menu.c: In function =E2=80=98get_symbol_str=E2=80=99:
>> scripts/kconfig/menu.c:590:18: warning: =E2=80=98jump=E2=80=99 may be us=
ed
>> uninitialized in this function [-Wmaybe-uninitialized]
>>      jump->offset =3D strlen(r->s);
>>                   ^
>> scripts/kconfig/menu.c:551:19: note: =E2=80=98jump=E2=80=99 was declared=
 here
>>   struct jump_key *jump;
>>                    ^
>>   HOSTLD  scripts/kconfig/conf
>> scripts/kconfig/conf --oldconfig Kconfig
>> #
>> # configuration written to .config
>> #
>> scripts/kconfig/conf --silentoldconfig Kconfig
>>
>> The fix is "kconfig: Fix warning "=E2=80=98jump=E2=80=99 may be used uni=
nitialized"" upstream.
>
>
> Sure, what's the git commit id of the patch in Linus's tree?  That's
> annoying to me as well, thanks for reminding me about it.
>

Yesterday, I played with llvmlinux and this patch is also required for
Linux v3.10.y.

Checking for "Peter K=C3=BCmmel" shows no hits.

commit 2d560306096739e2251329ab5c16059311a151b0 upstream
"kconfig: Fix warning "=E2=80=98jump=E2=80=99 may be used uninitialized""

The patch needs some adaptation to fit.

Unfortunately, I cannot add a "3.10" to the subject-line as it is
"UTF-8-truncated" (see attached file).

Shall I resend w/ all CCs and how can I fix the subject-line?

- Sedat -

[1] http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log=
/?h=3Dlinux-3.10.y&qt=3Dgrep&q=3DPeter+K%C3%BCmmel

--f46d044280c6f4388a051070c9ef
Content-Type: text/x-diff; charset=UTF-8;
	name="0001-kconfig-Fix-warning-jump-may-be-used-uninitialized-3.10.patch"
Content-Disposition: attachment;
	filename="0001-kconfig-Fix-warning-jump-may-be-used-uninitialized-3.10.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i6ud0h6i0

RnJvbSA2ODNiMDdkYzIwNjFjYThkNDA4NmQzNDgwY2E4NmNjOWRhZDg5MmM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/UGV0ZXI9MjBLPUMzPUJDbW1lbD89IDxzeW50
aGV0aWNwcEBnbXgubmV0PgpEYXRlOiBUdWUsIDQgTm92IDIwMTQgMTI6MDE6NTkgKzAxMDAKU3Vi
amVjdDogW1BBVENIXSA9P1VURi04P3E/a2NvbmZpZzo9MjBGaXg9MjB3YXJuaW5nPTIwIj1FMj04
MD05OGp1bXA/PQogPT9VVEYtOD9xPz1FMj04MD05OT0yMG1heT0yMGJlPTIwdXNlZD0yMHVuaW5p
dGlhbGl6ZWQiPz0KTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKCldhcm5pbmc6Cklu
IGZpbGUgaW5jbHVkZWQgZnJvbSBzY3JpcHRzL2tjb25maWcvemNvbmYudGFiLmM6MjUzNzowOgpz
Y3JpcHRzL2tjb25maWcvbWVudS5jOiBJbiBmdW5jdGlvbiDigJhnZXRfc3ltYm9sX3N0cuKAmToK
c2NyaXB0cy9rY29uZmlnL21lbnUuYzo1OTA6MTg6IHdhcm5pbmc6IOKAmGp1bXDigJkgbWF5IGJl
IHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV21heWJlLXVuaW5pdGlhbGl6
ZWRdCiAgICAganVtcC0+b2Zmc2V0ID0gc3RybGVuKHItPnMpOwoKU2ltcGxpZmllcyB0aGUgdGVz
dCBsb2dpYyBiZWNhdXNlIChoZWFkICYmIGxvY2FsKSBtZWFucyAoanVtcCAhPSAwKQphbmQgbWFr
ZXMgR0NDIGhhcHB5IHdoZW4gY2hlY2tpbmcgaWYgdGhlIGp1bXAgcG9pbnRlciB3YXMgaW5pdGlh
bGl6ZWQuCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBLw7xtbWVsIDxzeW50aGV0aWNwcEBnbXgubmV0
PgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgTWFyZWsgPG1tYXJla0BzdXNlLmN6PgotLS0KWyBkaWxl
a3M6IHYyOiBCYWNrcG9ydGVkIHRvIGZpdCB2My4xMCBdCgogc2NyaXB0cy9rY29uZmlnL21lbnUu
YyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2tjb25maWcvbWVudS5jIGIvc2NyaXB0cy9rY29uZmln
L21lbnUuYwppbmRleCBmZDNmMDE4MGUwOGYuLjZhZjFjNDJhOWNmMyAxMDA2NDQKLS0tIGEvc2Ny
aXB0cy9rY29uZmlnL21lbnUuYworKysgYi9zY3JpcHRzL2tjb25maWcvbWVudS5jCkBAIC01MjUs
NyArNTI1LDcgQEAgc3RhdGljIHZvaWQgZ2V0X3Byb21wdF9zdHIoc3RydWN0IGdzdHIgKnIsIHN0
cnVjdCBwcm9wZXJ0eSAqcHJvcCwKIHsKIAlpbnQgaSwgajsKIAlzdHJ1Y3QgbWVudSAqc3VibWVu
dVs4XSwgKm1lbnUsICpsb2NhdGlvbiA9IE5VTEw7Ci0Jc3RydWN0IGp1bXBfa2V5ICpqdW1wOwor
CXN0cnVjdCBqdW1wX2tleSAqanVtcCA9IE5VTEw7CiAKIAlzdHJfcHJpbnRmKHIsIF8oIlByb21w
dDogJXNcbiIpLCBfKHByb3AtPnRleHQpKTsKIAltZW51ID0gcHJvcC0+bWVudS0+cGFyZW50OwpA
QCAtNTYzLDcgKzU2Myw3IEBAIHN0YXRpYyB2b2lkIGdldF9wcm9tcHRfc3RyKHN0cnVjdCBnc3Ry
ICpyLCBzdHJ1Y3QgcHJvcGVydHkgKnByb3AsCiAJCXN0cl9wcmludGYociwgXygiICBMb2NhdGlv
bjpcbiIpKTsKIAkJZm9yIChqID0gNDsgLS1pID49IDA7IGogKz0gMikgewogCQkJbWVudSA9IHN1
Ym1lbnVbaV07Ci0JCQlpZiAoaGVhZCAmJiBsb2NhdGlvbiAmJiBtZW51ID09IGxvY2F0aW9uKQor
CQkJaWYgKGp1bXAgJiYgbWVudSA9PSBsb2NhdGlvbikKIAkJCQlqdW1wLT5vZmZzZXQgPSByLT5s
ZW4gLSAxOwogCQkJc3RyX3ByaW50ZihyLCAiJSpjLT4gJXMiLCBqLCAnICcsCiAJCQkJICAgXyht
ZW51X2dldF9wcm9tcHQobWVudSkpKTsKLS0gCjIuMy4xCgo=
--f46d044280c6f4388a051070c9ef--
