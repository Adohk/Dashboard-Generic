using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace Dashboard.App_Start {
    public class HashClass {
        public static string CreateHash(string password) {
            SHA256CryptoServiceProvider Sha256Obj = new SHA256CryptoServiceProvider();
            Byte[] ToHash = Encoding.UTF8.GetBytes(password);
            ToHash = Sha256Obj.ComputeHash(ToHash);
            string result = String.Empty;

            foreach (Byte b in ToHash) {
                result += b.ToString("x2");
            }
            return result.Trim();
        }

        public static bool CompareHash(string Current, string ToCompare) {
            if (Current.Trim() == ToCompare.Trim()) {
                return true;
            } else {
                return false;
            }
        }

        public static string CreateSalt() {
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buff = new byte[32];
            rng.GetBytes(buff);
            return Convert.ToBase64String(buff);
        }
    }
}